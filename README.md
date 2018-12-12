
## A Quick Introduction
LcastLogs is a logging addon for Garry's Mod.
LcastLogs takes events from your server, and then turns them into messages in a Discord channel.
It's a pretty simple concept.

## Yeah, so what can it do?
 * It can be searched easily thanks to using colors and simple titles
 * It will bundle multiple events into a single message so Discord doesn't get angry for spamming.
 * If Discord does get angry, it handles that too. (It handles rate limits)
 * You can turn logs on or off.
 * You can change what color each log is, individually.
 * You can choose to send different logs to different channels, or even to many channels if you want.
 * You can choose what title is displayed on each log.

That's about it really. Pretty simple.

## Show us
Fine.
![some of the cool ass log stuff](https://images.lcast15.com/LcastLogs1.PNG)
![just like real life](https://images.lcast15.com/LcastLogs2.PNG)
![darkrp stuff](https://images.lcast15.com/LcastLogs3.PNG)
![ttt stuff](https://images.lcast15.com/LcastLogs4.PNG)

All commands follow a similar structure.

## How do make work?!?11!

### 1. **Download the addon**
[Here's a handy link.](https://github.com/Lcast15/LcastLogs/archive/master.zip)
### 2. **Extract the addon**
Just extract the .zip you just downloaded into `garrysmod/addons/lcastlogs`. We'd suggest not using capitals cause Garry's Mod on Linux doesn't [l](https://wiki.garrysmod.com/page/file/Read)[i](https://wiki.garrysmod.com/page/file/Write)[k](https://github.com/Facepunch/garrysmod-issues/issues/2458)[e](https://forum.facepunch.com/gmodgd/japw/Gmod-on-Linux-based-OS/1/#postcbcgl) it.
   
### 3. **Configuration!**
Open `garrysmod/addons/lcastlogs/lua/lcastlogsconfig/config.lua` up in ~~Notepad++~~ your choice of text editor. The file explains how to configure it, but it's basically just copy pasting some values in.
### 4. **More configuration!**
Surprisingly, all the files in `garrysmod/addons/lcastlogs/lua/lcastlogsconfig` are actually configuration files! It's a good idea to open all the relevant ones and make sure the default configuration values are what you want.

## Why wouldn't i just use X other addon?
You can choose to use whatever addon you want, but if you want some reasons why we think LcastLogs might be a better option:

 * [bLogs](https://www.gmodstore.com/market/view/1599)
	 * LcastLogs doesn't care if you stole it, it will run anyway. (because its free)
	 * LcastLogs doesn't care if you don't have a port forwarded server or a static IP.
	 * LcastLogs uses a friendly, familiar interface. Discord's.
	 * But what about the free [bLogs Discord Relay](https://www.gmodstore.com/market/view/5407)?
		 * LcastLogs has avatars? I dunno, i don't own bLogs nor this extension. (please make a pull request with more reasons if you own this and find some reasons <3)
	 * But what about the paid [bLogs Web Panel](https://www.gmodstore.com/market/view/5652)?
		 * LcastLogs is self-contained to your Garry's Mod server (and Discord, of course) so you don't need to worry about setting up a database, or a HTTP server or anything else.
		 * LcastLogs doesn't yet have an alternative to web panels. If you need a web panel, by all means pay the $11.98 for bLogs and it's web panel ~~extension~~ DLC. Otherwise [mLogs 2](https://www.gmodstore.com/market/view/2310) will do web panels for cheaper ($6.49) and you dont even need to host the web panel, it comes part of your purchase.
 * [pLogs-2](https://github.com/aStonedPenguin/pLogs-2)
	 * LcastLogs doesn't use databases.
	 * LcastLogs supports more log types in areas. We're working to support even more.
	 * LcastLogs is still an active project.
     I actually don't mind pLogs, it's alright. As far as i know aStonedPenguin isn't supporting it anymore however.
 * [Three's Discord Logs](https://www.gmodstore.com/market/view/5393)
	 * LcastLogs is free.
	 * Our embeds are more rich with information.
	 * LcastLogs supports more log types in areas. We're working to support even more.
	 I don't own Three's Discord Logs, if you do and have some better reasons to add, please make a pull request and add your reasons.

## Currently Supported Log Types:

 * Main:
	 * Connections
	 * Disconnections
	 * Player Spawns
	 * Global Chats
	 * Team Chats
	 * CVar Changed (if ULib is installed)
	 * Player Death
	 * Server Initialized
 * ULX:
	 * Name Change
	 * Command Called
 * Sandbox: (Sandbox logs can run on sandbox-derrived gamemodes like DarkRP)
	 * Toolgun
	 * Prop Spawn
	 * Vehicle Spawn
	 * SWEP Spawn
	 * SWEP Given
	 * SENT Spawn
	 * Effect Spawn
	 * NPC Spawn
	 * Ragdoll Spawn
 * TTT:
	 * Equipment Ordered
	 * DNA Found
	 * Used Health Station
	 * Body Found
	 * Round End
	 * Player Death
 * DarkRP:
	 * Law Added
	 * Law Removed
	 * Laws Reset
	 * Agenda Updated
	 * Variable Changed
	 * Lockpick Started
	 * Lockpick Completed
	 * Lottery Started
	 * Lottery Ended
	 * Money Printer Printed
	 * Money Printer Caught Fire
	 * Co-owner Added
	 * Co-owner Removed
	 * DarkRP Command Called
	 * Weapon Dropped
	 * Door Ram Used
	 * Hit Accepted
	 * Hit Completed
	 * Hit Failed
	 * Tax Paid
	 * Name Changed
	 * Job Changed
	 * Demoted
	 * Player First Joined
	 * Item Pocketed
	 * Item Dropped
	 * Property Taxed
	 * AFK Demoted
	 * Arrested
	 * Ammo Bought
	 * Entity Bought
	 * Vehicle Bought
	 * Door Bought
	 * Food Bought
	 * Pistol Bought
	 * Shipment Bought
	 * Cheque Dropped
	 * Money Dropped
	 * Money Given
	 * Lottery Entered
	 * Salary Received
	 * Door Sold
	 * Money Picked Up
	 * Weapon Picked Up
	 * AFK Status
	 * Starved
	 * Cheque Torn Up
	 * Un-arrested
	 * Un-wanted
	 * Un-warranted
	 * Wanted
	 * Warranted
	 * Weapons Checked
	 * Weapons Confiscated
	 * Weapons Returned

And more on the way! Have a suggestion? [Make an issue](https://github.com/Lcast15/LcastLogs/issues/new)! Better yet, if you've created or started making a new module for LcastLogs, make a pull request and i might add it!