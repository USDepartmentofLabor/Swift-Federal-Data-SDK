Swift-Federal-Data-SDK
======================

Federal Data SDK built in the Swift programming language

### TODO:
* Add XML and other text (e.g. HTML) support

### Documentation
Documentation for this SDK can be found at [http://USDepartmentofLabor.github.io/Swift-Federal-Data-SDK](http://USDepartmentofLabor.github.io/Swift-Federal-Data-SDK).

Sample code for this SDK can be found at [http://usdepartmentoflabor.github.io/Swift-Sample-App/](http://usdepartmentoflabor.github.io/Swift-Sample-App/).

## Federal API compatibility
This SDK should work the following APIs.  We encourage you to test this with the APIs below as well as other federal APIs:

### Business USA
* [BusinessUSA Business Resource API](http://business.usa.gov/apis) - Data is received, but unusual first character trips-up the parser.

### Department of Commerce
#### Census Bureau
* [All Datasets](http://www.census.gov/developers/) (because of the format of the output, use the didCompleteWithUnParsedResults callback method)

#### NOAA
* [Climate Data Online](http://www.ncdc.noaa.gov/cdo-web/)
* [Severe Weather Data Inventory](http://www.ncdc.noaa.gov/cdo-web/)

### Department of Education
* [All Datasets](http://www.ed.gov/developers)

### Department of Energy
* [EIA (beta)](http://www.eia.gov/developer/)
* [Fuel Economy](http://www.fueleconomy.gov/feg/ws/index.shtml)
* [NREL](http://developer.nrel.gov)

### Department of Health and Human Services
#### Healthdata.gov
* [Healthdata.gov API](http://www.healthdata.gov/developer)

#### National Center for Health Statistics
* [Health Indicators Warehouse](http://healthindicators.gov/Developers/)

#### National Health Information Center
* [Healthfinder.gov API](http://healthfinder.gov/developers/)

#### National Institutes of Health
* [DailyMed](http://dailymed.nlm.nih.gov/dailymed/help.cfm)
* [DIRLINE](http://dirline.nlm.nih.gov/dirlineapi/DIRLINEWebService.html)
* [Genetics Home Reference](http://ghr.nlm.nih.gov/LinkingTo)
* [MedlinePlus Connect](http://www.nlm.nih.gov/medlineplus/connect/service.html)
* [MedlinePlus HealthTopics](http://www.nlm.nih.gov/medlineplus/webservices.html)
* [National Drug File-Reference Terminology (NDF-RT)](http://rxnav.nlm.nih.gov/NdfrtAPI.html)
* [Pillbox (needs verification)](http://pillbox.nlm.nih.gov/API-documentation.html)
* [RxNorm](http://rxnav.nlm.nih.gov/RxNormAPI.html)
* [RxTerms](http://rxnav.nlm.nih.gov/RxTermsAPI.html)

#### Substance Abuse and Mental Health Services Administration
* [SAMHSA API](http://store.samhsa.gov/developer)

### Department of Labor 
* [All Datasets](http://developer.dol.gov) (SummerJobs+ service compatibility still needs work)

### Department of Transportation
#### FAA
* [Airport Status and Delay API](http://services.faa.gov/)

#### Federal Motor Carrier Safety Administration
* [FMCSA API](https://mobile.fmcsa.dot.gov/developer)

### EPA
* [Envirofacts API](http://www.epa.gov/developer/)

### FCC
* [Public Inspection Files](https://stations.fcc.gov/developer/)
* [Census Block Conversions](http://www.fcc.gov/developers/census-block-conversions-api)

### Federal Infrastructure Projects Permitting Dashboard (beta)
* [performance.gov API](http://permits.performance.gov/developers-api)

### Federal Reserve Bank of St. Louis
* [FRED](http://api.stlouisfed.org/)

### Integrated Taxonomic Information System
* [ITIS API](http://www.itis.gov/ws_description.html)

### Millennium Challenge Corporation
* [Selection Indicators API](http://data.mcc.gov/developer/)

### NASA
* [NASA API](http://data.nasa.gov/api-info/)

### National Archives and Records Administration
* [Federal Register API](http://www.federalregister.gov/blog/learn/developers)

### National Broadband Map
* [All APIs](http://www.broadbandmap.gov/developer/)

### Office of Management and Budget
* [usaspending.gov API](http://www.usaspending.gov/data?tab=API)

### Small Business Administration
* [Business Licenses & Permits](http://www.sba.gov/about-sba-services/7615)
* [Loans & Grants Search](http://www.sba.gov/about-sba-services/7616)
* [Recommended Sites](http://www.sba.gov/about-sba-services/7630)
* [U.S. City and County Web Data](http://www.sba.gov/about-sba-services/7617)

### Small Business Innovation Research (SBIR) program
* [SBIR API](http://www.sbir.gov/apis)

### USA.gov
* [go.USA.gov URL shortener](https://go.usa.gov/api)
* [Mobile App Gallery](http://www.usa.gov/About/developer-resources/mobile-app-gallery/index.shtml)
* [Social Media Registry](http://www.usa.gov/About/developer-resources/social-media-registry.shtml) (returns HTML)

### White House
* [Policy Snapshots JSON Feed](http://www.whitehouse.gov/developers)
