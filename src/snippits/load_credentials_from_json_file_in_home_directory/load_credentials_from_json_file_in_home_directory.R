#!/usr/bin/Rscript

# install.packages("rjson")
# install.packages("argparse")
library(rjson)
library(argparse)

arg_parser <- ArgumentParser()

arg_parser$add_argument("--ipam-credentials-file",
	default = "~/.config/IAS/some-awesome-project/ipam_credentials.json"
)

args <- arg_parser$parse_args()

# print(args$ipam_credentials_file)
result <- fromJSON(
	file = args$ipam_credentials_file
)


print(result$username)

