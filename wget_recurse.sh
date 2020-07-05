# Explanation:

# It will download all files and subfolders in ddd directory
# -r : recursively
# -np : not going to upper directories, like ccc/ddd
# -nH : not saving files to hostname folder
# --cut-dirs=3 : but saving it to ddd by omitting first 3 folders aaa, bbb, ccc
# -R index.html : excluding index.html files

# Note: wget can't download files from HTTPS server
# Workaround:
# Append '--secure-protocol tlsv1' to your wget command:

# source: https://stackoverflow.com/questions/23446635/how-to-download-http-directory-with-all-files-and-sub-directories-as-they-appear
# source2: https://github.com/WhitewaterFoundry/Fedora-Remix-for-WSL/issues/10

wget -r -np -nH --cut-dirs=3 -R index.html http://hostname/aaa/bbb/ccc/ddd/ --secure-protocol tlsv1