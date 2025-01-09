# pce-gener

Personal project. A script I'm writing to assist in geneing not cats for the game Pixel Cat's End. Currently only runs on the command line. I'm being lazy about error handling while I test my logic, as I plan on changing the input method into a real UI.

## Functionality (Command Line Only)
- Generates species allele for any not cat
- Generates wind allele for any not cat
- Generates fur allele for any not cat
- Generates color allele for north, south, and trade wind not cats, and partial color allele for null wind not cats
- Prints updated genome

## Notes
- As it is impossible to determine whether the wind allele of a trade wind not cat is NS or SN without a family tree, this script defaults to NS.
- As it is also impossible to determine whether an albino cat is BO or OB, this script defaults to BO. *Please note that the order DOES matter here for cats where the color is visible.*
- This script does not account for the pushy north gene.
- This script does not currently account for tortoiseshell trade wind not cats.