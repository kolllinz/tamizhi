![[kelly-sikkema-wbs4KV6cD6U-unsplash.jpg]]
<div style='text-align: right;'>Photo by <a href="https://unsplash.com/@kellysikkema?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Kelly Sikkema</a> on <a href="https://unsplash.com/photos/-8ijVEhjkS8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></div>


# Project Tamizhi

![[keymap_kural01.png]]

The aim of this project is to create a wholesome tamil environment in linux framebuffer console. Anyone can contribute to this project. This repository contains fonts, keymaps, shell-scripts, etc., which can be used in linux tty consoles to view tamil texts. 

## Tamizhi Keyboard Layout

The tamizhi keyboard layout is designed to facilitate input of tamil letters in console. To install the tamizhi keyboard layout, move the tamizhi.map.gz file to the appropriate keymap directory in linux. In Gentoo Linux, the default keymap location is **/usr/share/keymap/**. It might vary for other distribution.

Inside the keymap directory, several directories would be present for architecture specific keymaps. In this guide, I use **i386**, but you could choose one based on your system architecture. Then we will create a seperate directory named **tamizhi** and place the keymap file inside that directory. 

```shell
cd Shell_Scripts
sudo mkdir /usr/share/keymaps/i386/tamizhi
sudo mv tamizhi.map.gz /usr/share/keymaps/i386/tamizhi/
```

Now, we can use this layout by simply typing the below command 
```Shell
sudo loadkeys us
sudo loadkeys tamizhi
```

Remember to do the above command in seperate tty so that you can toggle between US English and Tamizhi layout. To toggle, simply press up arrow to retrieve command history. (English won't work in Tamizhi keyboard, so if you want to type any command you need to switch to us keyboard, apart from this, keys to change tty's would work fine).

#### Usage

![[Keyboard_Tamil.png]]

Tamizhi Keyboard layout uses mod keys to input tamil letters. There are 6 mod keys in Tamizhi layout from M1 to M6. Tamil Vowels (Naedil letters need Shift to enter) and Consonants can be typed without Mod keys. 

##### Vowels 
![[Keyboard_Tamil(18).png]]

##### Vowels (ShiftR Pressed)
![[Keyboard_Tamil(19).png]]

##### Numerals
![[Keyboard_Tamil(20).png]]

##### Numerals (ShiftL Pressed)
![[Keyboard_Tamil(21).png]]

Combined Letters require Mod key to be pressed before pressing the consonant. Mod keys and their combinations are called Modes. Following are the Modes used to input tamizhi:

| Modes | Keys to be pressed before pressing consonant|
|-------|:---------------------------------------------:|
| Mode 1 | M1 |
| Mode 2 | M2 |
| Mode 3 | M3 |
| Mode 4 | M4 |
| Mode 5 | M5 |
| Mode 6 | M6 |
| Mode 7 | M1 + M2 |
| Mode 8 | M1 + M3 |
| Mode 9 | M1 + M4 |
| Mode 10 | M1 + M5 |
| Mode 11 | M1 + M6 |
| Mode 12 | M2 + M3 |

Lets see each mode one by one

##### Normal State
![[Keyboard_Tamil(2).png]]

Above layout shows the behaviour of keys when Mod keys are not pressed.

##### Mode 1
![[Keyboard_Tamil(3).png]]

##### Mode 2
![[Keyboard_Tamil(4).png]]

##### Mode 3
![[Keyboard_Tamil(5).png]]

##### Mode 4
![[Keyboard_Tamil(6).png]]

##### Mode 5
![[Keyboard_Tamil(7).png]]

##### Mode 6
![[Keyboard_Tamil(8).png]]

##### Mode 7
![[Keyboard_Tamil(9).png]]

##### Mode 8
![[Keyboard_Tamil(10).png]]

##### Mode 9
![[Keyboard_Tamil(11).png]]

#### Mode 10
![[Keyboard_Tamil(12).png]]

##### Mode 11
![[Keyboard_Tamil(13).png]]

##### Mode 12
![[Keyboard_Tamil(14).png]]


## Tamizhi font 

Unlike European Languages, Most of the Asian ones have something called tone or vowel markings. Some of the european languages do have tone markings (like german umlaut or spanish virgulilla) but they are not prominent. Because of this tone marks, it becomes necessary to create seperate glyphs for each combinations. As each tone marks are either prefixed or suffixed to a letter, the width of those letters expand leading us to variable width fonts. We use variable width font almost everywhere, from website to applications and so on. Unfortunately linux framebuffer doesn't support variable width fonts. 

Apart from this, it has several other limitations. A Linux Framebuffer only able to handle 512 glyphs (some modern framebuffer might handle more, but im not sure about that). To have 16 bit color, the limit comes to 256 glyphs. It uses .psf fonts which when you think about it, it wouldn't be as easy as you procure any regular .ttf font even. 

These limitations are just the tip of the iceberg. Like i said earlier, most of the asian languages have variable widths. Because of their complexity, printing chinese in framebuffer would be extremely difficult. But Tamil on the other hand, have simple character structure. Not as simple as english, but it is indeed simple compared to other asian language.

Another difficulty one might face in creating mono font for tamil is the lack of unicode points for Tamil. Tamil Unicode Block only contains glyph for vowels, consonants and tone markings. This wouldn't be much of a problem in web rendering, but in console, each glyph will be printed individually. Lets say if we want to print tamil letter "கி".  Websites would render க + ி as கி, consoles on the other hand show them as `க ி`. Some even have vowel markings present both left and right side of a glyph (eg. போ, கௌ).

![[tamil_text01.png]]


So, in order to overcome this, we can use other glyphs exists in unicode to use as a substitute for combined characters. Tamil Language has 12 vowels and 18 consonants. These when combine together produce 216 characters. we have unicode for 12 vowels and 18 consonants already, for the remaining 216 characters, i picked Braille unicode block as it contains 256 characters to choose from and it is not commonly used. I encoded tamil glyph in braille unicode in a bitmap file, then converted it into psfu font.

![[keymap02.png]]

With this we now have 12+18 tamil characters and 216 tamil letter combinations (lets call it tamizhi characters). Adding Capital and Small English Alphabets and some essential characters, we would approximately have 400 glyphs which is less that the fixed limit (i.e., 512). 

To install this tamizhi font, do the following:

1. Place the tamizhi font file inside **/usr/share/consolefonts** directory (this location might vary from distribution to distribution, so change it accordingly)
```Shell
cd Fonts
mv tamizhi_8x16.psfu.gz /usr/share/consolefonts
```

2. Issue the following command to set the tamizhi font.
```Shell
cd /usr/share/consolefonts
setfont tamizhi_8x16.psfu.gz
```

Optionally, in OpenRC systems, you can make it your default console font, by placing `consolefont="tamizhi_8x16"` in **/etc/conf.d/consolefont** file.

## Using Tamizhi

#### tamizhi_encoder.sh

Using this, one can able to translate ordinary tamil texts into tamizhi texts which will later be able to view in console having tamizhi font. To convert documents to tamizhi text, follow these steps:

1. Go to the Shell Scripts directory.
```Shell
cd Shell_Scripts
```

2. Make sure the script is being an executable file.
```Shell
chmod +x tamizhi_encoder.sh
```

4. Execute tamizhi_encoder.sh with the path of the file as argument.
```Shell
./tamizhi_encoder.sh /path/to/file.txt
```

#### tamizhi_decoder.sh

It is used to decode tamizhi texts into ordinary tamil texts. Steps to run tamizhi_decoder.sh are similar to tamizhi_encoder.sh. Refer above

```Shell
cd Shell_Scripts
chmod +x tamizhi_decoder.sh
./tamizhi_decoder.sh /path/to/file.txt
```

#### thirukkural.sh

When given kural number as argument, this script will fetch thirukkural from online and print on the standard output. For example:

```Shell
cd Shell_Scripts
chmod +x thirukkural.sh 
./thirukkural.sh 343
```

#### index_creator.sh

Many would wish to read news or articles from websites i console. This can be accomplished by using text based browsers like elinks and lynx. It is possible to make text based browsers entirely for tamizhi. Unfortunately, I don't posses skill to do that. I made this simple script that would fetch html page for a website, convert it into tamizhi letters and then show the html page in lynx browser. I make it for testing purposes. If anyone made a fully functional browser for tamizhi, it would be much appreciated.

```Shell
cd Shell_Scripts
chmod +x index_creator.sh
./index_creator.sh

Enter URL (starting with https://): https://www.example.com/ta

```
