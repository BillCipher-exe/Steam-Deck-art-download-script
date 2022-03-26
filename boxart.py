import urllib.request
import urllib.response
import re
import os

print("Input ID of the Steam game:")
gameID = input()
desktopfolder = os.path.expanduser('~/Desktop/steam_cover_art/')
if not os.path.exists(desktopfolder):
    os.makedirs(desktopfolder)

try:
    URLOpen = urllib.request.urlopen("https://steamcdn-a.akamaihd.net/steam/apps/"
                                    + gameID + "/library_600x900_2x.jpg").read()
    open(desktopfolder + gameID + 'p.jpg', 'wb+').write(URLOpen)
    URLOpen = urllib.request.urlopen("https://steamcdn-a.akamaihd.net/steam/apps/"
                                    + gameID + "/header.jpg").read()
    open(desktopfolder + gameID + '.jpg', 'wb+').write(URLOpen)
    URLOpen = urllib.request.urlopen("https://steamcdn-a.akamaihd.net/steam/apps/"
                                    + gameID + "/library_hero.jpg").read()
    open(desktopfolder + gameID + '_hero.jpg', 'wb+').write(URLOpen)
    URLOpen = urllib.request.urlopen("https://steamcdn-a.akamaihd.net/steam/apps/"
                                    + gameID + "/logo.png").read()
    open(desktopfolder + gameID + '_logo.jpg', 'wb+').write(URLOpen)
except Exception as e:
    ResponseData = e.read().decode("utf8", 'replace')
