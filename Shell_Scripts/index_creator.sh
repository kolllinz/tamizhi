#!/bin/bash

# Prompt for URL
read -p "Enter URL (starting with https://): " url

# Check if URL starts with https://
if [[ $url == https://* ]]; then
  # Fetch the web page using curl
  content=$(curl -s "$url")

  # Apply sed substitution commands
  modified_content=$(echo "$content" | sed 's/க்/⡀/g; s/கா/⡁/g; s/கி/⡂/g; s/கீ/⡃/g; s/கு/⡄/g; s/கூ/⡅/g; s/கெ/⡆/g; s/கே/⡇/g; s/கை/⡈/g; s/கொ/⡉/g; s/கோ/⡊/g; s/கௌ/⡋/g;
            s/ங்/⡌/g; s/ஙா/⡍/g; s/ஙி/⡎/g; s/ஙீ/⡏/g; s/ஙு/⡐/g; s/ஙூ/⡑/g; s/ஙெ/⡒/g; s/ஙே/⡓/g; s/ஙை/⡔/g; s/ஙொ/⡕/g; s/ஙோ/⡖/g; s/ஙௌ/⡗/g;
            s/ச்/⡘/g; s/சா/⡙/g; s/சி/⡚/g; s/சீ/⡛/g; s/சு/⡜/g; s/சூ/⡝/g; s/செ/⡞/g; s/சே/⡟/g; s/சை/⡠/g; s/சொ/⡡/g; s/சோ/⡢/g; s/சௌ/⡣/g;
            s/ஞ்/⡤/g; s/ஞா/⡥/g; s/ஞி/⡦/g; s/ஞீ/⡦/g; s/ஞு/⡨/g; s/ஞூ/⡩/g; s/ஞெ/⡪/g; s/ஞே/⡫/g; s/ஞை/⡬/g; s/ஞொ/⡭/g; s/ஞோ/⡮/g; s/ஞௌ/⡯/g;
            s/ட்/⡰/g; s/டா/⡱/g; s/டி/⡲/g; s/டீ/⡳/g; s/டு/⡴/g; s/டூ/⡵/g; s/டெ/⡶/g; s/டே/⡷/g; s/டை/⡸/g; s/டொ/⡹/g; s/டோ/⡺/g; s/டௌ/⡻/g;
            s/ண்/⡼/g; s/ணா/⡽/g; s/ணி/⡾/g; s/ணீ/⡿/g; s/ணு/⢀/g; s/ணூ/⢁/g; s/ணெ/⢂/g; s/ணே/⢃/g; s/ணை/⢄/g; s/ணொ/⢅/g; s/ணோ/⢆/g; s/ணௌ/⢇/g;
            s/த்/⢈/g; s/தா/⢉/g; s/தி/⢊/g; s/தீ/⢋/g; s/து/⢌/g; s/தூ/⢍/g; s/தெ/⢎/g; s/தே/⢏/g; s/தை/⢐/g; s/தொ/⢑/g; s/தோ/⢒/g; s/தௌ/⢓/g;
            s/ந்/⢔/g; s/நா/⢕/g; s/நி/⢖/g; s/நீ/⢗/g; s/நு/⢘/g; s/நூ/⢙/g; s/நெ/⢚/g; s/நே/⢛/g; s/நை/⢜/g; s/நொ/⢝/g; s/நோ/⢞/g; s/நௌ/⢟/g;
            s/ப்/⢠/g; s/பா/⢡/g; s/பி/⢢/g; s/பீ/⢣/g; s/பு/⢤/g; s/பூ/⢥/g; s/பெ/⢦/g; s/பே/⢧/g; s/பை/⢨/g; s/பொ/⢩/g; s/போ/⢪/g; s/பௌ/⢫/g;
            s/ம்/⢬/g; s/மா/⢭/g; s/மி/⢮/g; s/மீ/⢯/g; s/மு/⢰/g; s/மூ/⢱/g; s/மெ/⢲/g; s/மே/⢳/g; s/மை/⢴/g; s/மொ/⢵/g; s/மோ/⢶/g; s/மௌ/⢷/g;
            s/ய்/⢸/g; s/யா/⢹/g; s/யி/⢺/g; s/யீ/⢻/g; s/யு/⢼/g; s/யூ/⢽/g; s/யெ/⢾/g; s/யே/⢿/g; s/யை/⣀/g; s/யொ/⣁/g; s/யோ/⣂/g; s/யௌ/⣃/g;
            s/ர்/⣄/g; s/ரா/⣆/g; s/ரி/⣇/g; s/ரீ/⣈/g; s/ரு/⣉/g; s/ரூ/⣊/g; s/ரெ/⣋/g; s/ரே/⣌/g; s/ரை/⣍/g; s/ரொ/⣎/g; s/ரோ/⣏/g; s/ரௌ/⣐/g;
            s/ல்/⣑/g; s/லா/⣒/g; s/லி/⣓/g; s/லீ/⣔/g; s/லு/⣕/g; s/லூ/⣖/g; s/லெ/⣗/g; s/லே/⣘/g; s/லை/⣙/g; s/லொ/⣚/g; s/லோ/⣛/g; s/லௌ/⣜/g;
            s/வ்/⣝/g; s/வா/⣞/g; s/வி/⣅/g; s/வீ/⣟/g; s/வு/⣠/g; s/வூ/⣡/g; s/வெ/⣢/g; s/வே/⣣/g; s/வை/⣤/g; s/வொ/⣥/g; s/வோ/⣦/g; s/வௌ/⣧/g;
            s/ழ்/⣨/g; s/ழா/⣩/g; s/ழி/⣪/g; s/ழீ/⣫/g; s/ழு/⣬/g; s/ழூ/⣭/g; s/ழெ/⣮/g; s/ழே/⣯/g; s/ழை/⣰/g; s/ழொ/⣱/g; s/ழோ/⣲/g; s/ழௌ/⣳/g;
            s/ள்/⣴/g; s/ளா/⣵/g; s/ளி/⣶/g; s/ளீ/⣷/g; s/ளு/⣸/g; s/ளூ/⣹/g; s/ளெ/⣺/g; s/ளே/⣻/g; s/ளை/⣼/g; s/ளொ/⣽/g; s/ளோ/⣾/g; s/ளௌ/⣿/g;
            s/ற்/⠀/g; s/றா/⠁/g; s/றி/⠂/g; s/றீ/⠃/g; s/று/⠄/g; s/றூ/⠅/g; s/றெ/⠆/g; s/றே/⠇/g; s/றை/⠈/g; s/றொ/⠉/g; s/றோ/⠊/g; s/றௌ/⠋/g;
            s/ன்/⠌/g; s/னா/⠍/g; s/னி/⠎/g; s/னீ/⠏/g; s/னு/⠐/g; s/னூ/⠑/g; s/னெ/⠒/g; s/னே/⠓/g; s/னை/⠓/g; s/னொ/⠕/g; s/னோ/⠖/g; s/னௌ/⠗/g;')

  # Save modified content as index.html
  echo "$modified_content" > favourite.html

  echo "Modified HTML content saved as index.html"

  lynx favourite.html
else
  echo "Invalid URL. Please provide a URL starting with https://"
fi
