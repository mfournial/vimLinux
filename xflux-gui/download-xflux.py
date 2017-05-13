from sys import maxsize
import os

# There is similar code in ./debian/postinst. If you are changing this
# you probably want to change that too.
def download_xflux():
    # Determines which is the appropriate executable for 32-bit
    if maxsize == 2147483647:
        print("Downloading 32-bit xflux ...")
        url = "https://justgetflux.com/linux/xflux-pre.tgz"
    elif maxsize == 9223372036854775807:
        print("Downloading 64-bit xflux ...")
        url = "https://justgetflux.com/linux/xflux64.tgz"
    tarchive = "/tmp/xflux.tgz"
    os.system("wget '%s' -O'%s'" % (url, tarchive))
    os.system("tar -xvf '%s'" % tarchive)

if __name__ == '__main__':
    download_xflux()
