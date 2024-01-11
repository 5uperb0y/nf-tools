import re
import argparse
def extract_nextflow_module_comments(nf_path):
	"""
	Extract Nextlfow process and workflow names along with their associated multi-line comments.
	"""
	try:
		with open(nf_path, "r") as file:
			text = file.read()
	except IOError as e:
		print(f"Can not read the file: {e}")
		return
	pattern = r"(process|workflow)\s+(\w+)\s+\{[\s\S]*?\/\*([\s\S]*?)\*\/"
	matches = re.findall(pattern, text)
	for module_type, module_name, docstring in matches:
		print(f"{module_type} {module_name}\n{docstring}")
def main():
	parser = argparse.ArgumentParser(description="Extract multi-line comments from Nextflow modules")
	parser.add_argument("nf_path",
					 type=str,
					 help="path to a nextflow script to be processed")
	args = parser.parse_args()
	extract_nextflow_module_comments(args.nf_path)
if __name__ == "__main__":
	main()