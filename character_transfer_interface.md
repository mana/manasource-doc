---
title: character transfer interface
layout: wiki
---
{% include toc.md %}
#  character transfer interface

To allow a multi world server landscape there should be a standardized way to transfer characters to different servers to make it easier for players to switch servers. The system should be:
 * decentralized
 * tampering-proof
 * allow control for servers from where they import characters and how

When servers allow to import characters from themself this system can also be used to transfer characters between accounts.

##  Export interface

Exporting of characters should be done with the web interface of the server the character is on. The user selects which of their characters they want to export, enters a "character password" (which should differ from the account password) and then they can download an XML file with:

 * name
 * experience and attributes
 * possessions
 * (optional) character quest variables
 * hash of character password
 * URL to public key of the keypair used to sign the character file
 * cryptographical signature of the whole file with the private key of the keypair

The player can then use this file to import the character on another server.

##  Import interface

To import a character from another server the user uploads the XML file using the web interface of the target server and enters the character password.

Before the server accepts the character it has to check the following:

 * The name of the character may not be taken. When it is, the old character has to be deleted first. Allowing to change the name of the character during import would allow character duplication.
 * Every server will have a whitelist of public key URLs from which it accepts characters. That way servers can prevent people from importing high level characters from servers with easier gameplay.
 * The character password has to match the hash in the file, otherwise the character file might be stolen.
 * The cryptographic signature must match the public key. Otherwise the player has tampered with the character file.
 * Depending on the key URL the server might apply some additional rules:
    * Not accepting characters above or below a specific level
    * Reducing or increasing experience values to combensate for easier or harder gameplay on the source server
    * Deleting or replacing specific inventory items (the player should be warned about this) which don't exist on the target server or are much harder to get than on the source server
    * Deleting or setting quest variables (for example when the content of the target server is different from the source server)

##  Abuse Scenarios

Export your character, persuade an admin to rename the old character and reimport it. Now you have two identical characters with duplicated money and inventory items. **Solution:** When renaming a character save a list of previous character names and check this when importing.

Become an admin on a trusted server, import a character from another server, use your admin rights to level it up, reimport it on the original server. **Solution:** Server admins should choose carefully from which servers they allow character import.



