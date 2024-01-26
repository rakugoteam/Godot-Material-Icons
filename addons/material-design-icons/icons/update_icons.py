import re, json
import requests

# URLs of the files to download
css_url = "https://github.com/Templarian/MaterialDesign-Webfont/raw/master/css/materialdesignicons.css"
ttf_url = "https://github.com/Templarian/MaterialDesign-Webfont/raw/master/fonts/materialdesignicons-webfont.ttf"

# Function to download a file given its URL and save it with a specified name
def download_file(url, file_name):
	response = requests.get(url)
	with open(file_name, 'wb') as file:
		file.write(response.content)

# Download the CSS file
download_file(css_url, 'materialdesignicons.css')
print("CSS file downloaded.")

# Download the TTF font file
download_file(ttf_url, '../fonts/material_design_icons.ttf')
print("TTF font file downloaded.")

# Specify the path to your text file
file_path = 'materialdesignicons.css'

# Open the file in read mode
with open(file_path, 'r') as file:
	# Read the entire file content as a single string
	file_content = file.read()

# Define your regex pattern
pattern = re.compile(r'\.mdi-([a-zA-Z0-9-]+)::before \{\n\s+.*?content: "([^"]*)";\n\}',
	re.DOTALL
)

# Find all matches using the regex pattern
matches = re.findall(pattern, file_content)

# Create an empty dictionary to store the results
icons_dict = {}

# Now, 'matches' contains a list of tuples where each tuple contains the matched parts
for match in matches:
	mdi_class, content_hex = match
	content_unicode = content_hex.replace("\\", "")
	icons_dict[mdi_class] = content_unicode
	print(f"icon: {mdi_class}, unicode: {content_unicode }")

# Save the dictionary to a JSON file
with open('icons.json', 'w') as json_file:
	json.dump(icons_dict, json_file, indent=2)

print("Icons saved to 'icons.json'")
