import json
import sys
import requests
import random
import time

def find_domains_for_subdomain(subdomain):
	print("Finding domains that have \"" + subdomain + "\" subdomains...")
	domains = []
	deduping = []
	subdomain = subdomain + '.' 

	url = 'https://crt.sh/?q=' + subdomain + '%&output=json'
	response = requests.get(url)
	try:
		results = response.json()

		for result in results:
			domain = result.get("name_value")

			if subdomain in domain:
				domain = domain.split("\n")[0].replace("*.", "").replace(subdomain, "")
				parts = domain.split(".")

				sub_tlds = ["co", "com", "ac", "gov", "net"]

				if len(parts) == 2 and parts[-2] not in sub_tlds:
					domain = parts[-2] + "." + parts[-1]
				elif len(parts) > 2 and parts[-2] in sub_tlds:
					domain = parts[-3] + "." + parts[-2] + "." + parts[-1]
				else:
					domain = None

				if domain:
					possible_dupe = domain.split("-") # avoid things like dev001-company.net, dev002-company.net, dev003-company.net
					if len(possible_dupe) > 1:
						possible_dupe = possible_dupe[-1]
					else:
						possible_dupe = possible_dupe[0]

					if possible_dupe not in deduping:
						deduping.append(possible_dupe)
						domains.append(domain)

		print("Found " + str(len(domains)) + " domains")
	except json.decoder.JSONDecodeError as e:
		time.sleep(5)
		print("Invalid response from cert.sh - skipping this subdomain :/")

	return domains


def find_subdomains_for_domain(domain):
	print("Finding subdomains of \"" + domain + "\"...")

	domain = "." + domain
	subdomains = []

	url = 'https://crt.sh/?q=%' + domain + '&output=json'
	response = requests.get(url)
	try:
		results = response.json()

		for result in results:
			full_domain = result.get("name_value").split("\n")[0].replace("*.", "")

			if domain in full_domain:
				subdomain = full_domain.replace(domain, "")

				for part in subdomain.split("."):
					if part not in subdomains:
						subdomains.append(part)

		print("Found " + str(len(subdomains)) + " subdomains")
	except json.decoder.JSONDecodeError as e:
		time.sleep(5)
		print("Invalid response from cert.sh - skipping this domain :/")

	return subdomains

def main():
	if len(sys.argv) is 1:
		print('Pass in a starting subdomain (eg: "linkerd")')
		print('Usage: python better-subdomains.py linkerd {num_domains} {secondary_subdomains}')
		print('eg: python better-subdomains.py linkerd 100 10')
		print("")
		exit(1)

	subdomain = sys.argv[1]

	if len(sys.argv) > 2:
		num_domains = int(sys.argv[2])
	else:
		num_domains = 1

	if len(sys.argv) == 4:
		secondary_subdomains = int(sys.argv[3])
	else:
		secondary_subdomains = 0

	results = {}
	subdomains_processed = []
	domains_processed = []

	# STEP 1 - find domains that have the given subdomain
	subdomains_processed.append(subdomain)
	domains = find_domains_for_subdomain(subdomain)

	print("Collecting subdomains from " + str(num_domains) + " domain(s)...")


	# STEP 2 - find subdomains, those domains have

	if num_domains > len(domains):
		num_domains = len(domains)

	# pick domains to use randomly
	random.shuffle(domains)
	print("num domains to do stuff with: " + str(len(domains[0:num_domains])))
	for domain in domains[0:num_domains]:
		if domain not in domains_processed:
			domains_processed.append(domain)
			subdomains = find_subdomains_for_domain(domain)

			# add any returned subdomains to the final result set
			if subdomains:
				for subdomain in subdomains:
					if subdomain in results:
						results[subdomain] = results[subdomain] + 1
					else:
						results[subdomain] = 1


	# STEP 3 - use our list of subdomains to find new domains, and then more subdomains, and add them all to our list
	if secondary_subdomains > 0:
		# sort the subdomain results by their values (number of times a subdomain was seen), reversed
		most_common = list(dict(sorted(results.items(), key=lambda item: item[1])).keys())
		most_common.reverse()

		print("---")
		print("Processing " + str(secondary_subdomains) + " secondary subdomains")

		# loop through the most common subdomains, fetching more domains, then fetching more subdomains
		for subdomain in most_common[0:secondary_subdomains]:
			if subdomain in subdomains_processed:
				print("Skipping subdomain \"" + subdomain + "\" (already processed it)")
			else:
				print("Processing secondary subdomain: \"" + subdomain + "\"")
				subdomains_processed.append(subdomain)
				domains = find_domains_for_subdomain(subdomain)
				random.shuffle(domains)

				if len(domains) > 10:
					num_domains2 = 10
				else:
					num_domains2 = len(domains)

				for domain in domains[0:num_domains2]:
					if domain not in domains_processed:
						domains_processed.append(domain)
						subdomains = find_subdomains_for_domain(domain)

						# add any returned subdomains to the final result set
						if subdomains:
							for subdomain in subdomains:
								if subdomain in results:
									results[subdomain] = results[subdomain] + 1
								else:
									results[subdomain] = 1


	print("---")
	print("FINAL RESULTS:")
	print(dict(sorted(results.items(), key=lambda item: item[1])))


main()