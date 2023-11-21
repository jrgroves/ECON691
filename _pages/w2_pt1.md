---
title: Week Two
---
# Data in the Wild
The largest challenge in data analytics and economic reserach is obtaining the data one needs. Due to resource limitations we are typically forced with utliizing data that already exists and this requires us to either have to piece together data from a variety of sources, clean up existing data sources, or painstaking work of digitization manually. R can serve as an invaluable tool in this regard as it can help rsesolve many of the problems we face when trying to collect necessary data. Some of those ways include  
- Website Scraping
- Direct Downloads (APIs and JSON files)
- PDF Character Regonition  

These are just a few of the ways that we can utilize R and its various packages to automate what might be a restritively long manual process. We will not have time to talk about all of them, so we will focus on the use of APIs, but I do want to quickly mention the other two.

## Website Scraping
The thing to remember about websites is they are just like any other computer program and thus have code. Specifically, most webiste are written in a form of HTML and what a browser does is translate that HTML code into something more user friendly. Because a website is nothing more than code, we can utilize our tools in R to disect that code and filter out specific information to create the necessary dataset. This is becoming less and less popular because it is either becoming unnecessary as more sources provide either the data for download directly or via something like an API, or because those that do not want their data freely scraped are installing safeguards into their websites such as embedding the code in a javascript program or adding Captichas. As for these cases, if you run into something that just absolutely must scrape, the idea of blocking and breaking through barriers is something of a small arms race so search out solutions and you just might find them. 

If you need to scrape one or more website, you already have most of the tools you need. The most common package is *rvest* and it works by reading the HTML code into an R object and then looking for specific tag locations within the HTML. The easiest scrape occurs when the data you need is specifically in a table and so the program looks for the "tab" tag and then translates what it finds bewteen the start and end of that tag into a dataframe. In more complicated cases, you may need to find a more specific location using something such as an "xpath". Typically you can find this and narrow down where in the code a specific value or data is found using the "Inspect" option within Google's Chrome broswer which shows you the HTML code of any website. 

Another obsticle you might face is the case of a javascript embedded in the webpage which asks you to input a given value or search term and then it will display the results. In some cases, if the javascript returns a second webpage, you might be able to exploit the URL on the result page. For example, if you are looking home characteristics on some county webpages, there is a webpage for each property or the server essentially creates one and the parcel ID is part of the URL. In those cases you can just read that specific page into R and pull the data out. If you need to do several, you simply program a loop. In other cases you may need to utilize a bit more complicated methodology that involves having R pretent it is a person viewing a webpage. This is not impossible, but does take a bit of work. 

The question of the legality of web scraping is an open question and I think most legal views are it depends on its use. As a result, most of the time, the way we use it is generally covered under fair use doctrine. If we were, however, to use it to crate a different tool that we can then benefit directly from, such as pulling down data to train an AI that we then sell or provide commerically, then there might be issues. For our case, it is likely okay to seek forgiveness rather than permission.

## PDF Character Recognition

Sometimes older data is on hard copy only and needs to be digitized. Again, R can help us there so long as we can get high resolution scans of the objects or PDFs. In either case, which are pretty easy to obtain, we can utilize packages that allow R to "read" a pdf or image and recongize characters and numbers and then replicate that information in a dataframe or list that we can then manipulate. Two popular packages at the moment within R are *tesseract* and *magick* and you can find more information on their uses if you need to by doing a simple google search. 

## API and JSON 

It is becoming more common for data provides to provide deciated servers that can directly talk to computer programs such as R and provide the necessary data that is needed in real time. These are referred to as APIs which stands for Application Programming Interface. The idea of API has been around since the 1940s and it something we actually use almost everyday when we search the web. Google and broswers are actually APIs that send requests for HTML data. In terms of specific databases being accessed on the internet, the data is more typically in the form of JSON (JavaScript Object Notation) which is a file format that can easily be translated into something that can be presented as a dataframe or other object. 

I talk about the JSON file type because if there is no specific package to access a given API, you can still get and translate the data using packages that can translate JSON type data and communicate with any API. For our purposes, however, we are going to learn how to use the U.S. Census Buearu's main API and we can interact with it using the package *tidycensus*.

(Clicke for next step)[wk2_pt2.md]

