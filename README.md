## Code for an RShiny App to Map nCov2019 Line List Data

## Acknowledgements
We want to thank all the individuals and organizations across the world who have been willing and able to report data in as open and timely manner as possible. To see individuals involved in the often painstaking data curation process, please see [beoutbreakprepared/nCoV2019](https://github.com/beoutbreakprepared/nCoV2019).

### Citation
The shiny app code was adapted from [RShiny Superzip](https://github.com/rstudio/shiny-examples/tree/master/063-superzip-example) and uses tools from [MapBox](https://www.mapbox.com/) and [Leaflet.js](https://leafletjs.com/).  

### Notes on the code
To run, you need to create a folder called "secrets" and add to that folder:
1. A file called mapboxkey.txt that has your mapbox api key on the first line of an otherwise plain text file.
2.  A file called service_google_api_key.json that has the json object from your Google service API key (see https://gargle.r-lib.org/articles/non-interactive-auth.html for more information).

### Data
[Hubei cases](https://docs.google.com/spreadsheets/d/1itaohdPiAeniCXNlntNztZ_oRvjh0HsGuJXUJWET008/edit#gid=429276722) 

[Outside Hubei cases](https://docs.google.com/spreadsheets/d/1itaohdPiAeniCXNlntNztZ_oRvjh0HsGuJXUJWET008/edit#gid=0) 

The below is copied from a post in [Virological](http://virological.org/t/epidemiological-data-from-the-ncov-2019-outbreak-early-descriptions-from-publicly-available-data/337) by [Moritz Kraemer](http://evolve.zoo.ox.ac.uk/Evolve/Moritz_Kraemer.html) that describes the data.

Epidemiological data from the 2019 nCoV outbreak: early descriptions

We have collected publicly available information on cases confirmed during the ongoing nCoV-2019 outbreak. Data were entered in a spreadsheet with each line representing a unique case, including age, sex, geographic information, history and time of travel where available. Sources were included as a reference for each entry. Data is openly available here: https://tinyurl.com/s6gsq5y 107 and was last updated at 5pm, GMT, January 23, 2020. We encourage the use of these data, which is intended as a resource for the community.

In this initial release we focus on cases that were reported outside of Wuhan (202) and fatal cases in Wuhan that had good metadata (18). An initial timeline of events is published below which was last updated on January 21, 7:50pm GMT (Figure 1).

### License
See License.

## Additional license, warranty, and copyright information
We provide a license for the code (see LICENSE) and do not claim ownership, nor the right to license, the data we have obtained nor any third-party software tools/code used in our analyses.  Please cite the appropriate agency, paper, and/or individual in publications and/or derivatives using these data, contact them regarding the legal use of these data, and remember to pass-forward any existing license/warranty/copyright information.  As a reminder, THE DATA AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE DATA AND/OR SOFTWARE OR THE USE OR OTHER DEALINGS IN THE DATA AND/OR SOFTWARE.
