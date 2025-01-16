# Pixel Cat's End Gener

An app I'm writing to assist in geneing not cats for the game Pixel Cat's End.

## Installation

1. Clone the repo to your local machine.
2. Navigate into the project's base directory and run `bin/rails server` to start the server.
3. To run the main program, navigate to the root of the project and run ``ruby main.rb``.

## Usage (command line only)

 You will be prompted to answer questions about your not cat until the program gains enough knowledge to print a string representing the not cat's genome. Currently, the string will contain the alleles for species, wind, and fur, the color allele for north, south, and trade wind not cats, and part of the color allele for null wind not cats. The program does not currently account for growth rate or accent color alleles.

### Notes on Usage

- As it is impossible to determine whether the wind allele of a trade wind not cat is NS or SN without a family tree, this script defaults to NS.
- As it is also impossible to determine whether an albino cat is BO or OB, this script defaults to BO. *Please note that the order DOES matter here for cats where the color is visible.*
- This script does not account for the pushy north gene.
- This script does not currently account for tortoiseshell trade wind not cats.

## Testing

This project utilizes Ruby on Rail's built in test functions for each created model.

## To Do

*To do list items will go here.*

## Reference

- This app is for the game [Pixel Cat's End](https://pixelcatsend.com/).
- The official guide detailing not cat's appearances is located [here](https://www.pixelcatsend.com/article&article=14).
- I heavily relied on PCE user @Darkfang8901's [genetics guide](https://www.pixelcatsend.com/forum&topic=624) to write the logic of this app. Thanks, Darkfang!