# subhunter
Collection of tools to find subdomains

## Tools used:
* amass - https://github.com/OWASP/Amass
* sublist3r - https://github.com/aboul3la/Sublist3r
* subfinder - https://github.com/projectdiscovery/subfinder
* assetfinder - https://github.com/tomnomnom/assetfinder
* dnsbuffer - https://github.com/montg0mery/dnsbuffer
* httprobe - https://github.com/tomnomnom/httprobe

## Note:
There's a utility to grab the scan's results and append them to a custom DNS wordlist to be used for DNS bruteforce by other tools. Before using this tool, create your own wordlist file somewhere in your filesystem and change the 2 last lines in the script to find it.
