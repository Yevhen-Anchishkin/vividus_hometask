Description: Trying out VIVIDUS syntax

Lifecycle:
Examples:
{transformer=FROM_LANDSCAPE}
|search-input-field |By.fieldName(q)                 |
|search-button      |By.xpath((//*[@name='btnK'])[1])|
|all-time-rush      |By.xpath(//*[text()[contains(.,'Top 10 all-time rushing leaders - NFL.com')]])|
|album-description	|By.xpath(//*[@class='nfl-c-photo-album__description']/p)|
|next-button		|By.xpath(//button[@class='nfl-c-photo-album__next'])|
|first-name			|By.xpath(//*[@class='nfl-c-photo-album__photo-title' and text()[contains(.,'Emmitt Smith')]])|
|third-name			|By.xpath(//*[@class='nfl-c-photo-album__photo-title' and text()[contains(.,'Barry Sanders')]])|


Scenario: Verify the official NFL website is in TOP10
Given I am on a page with the URL 'https://www.google.com/'
When I enter `NFL rushing leader` in field located `<search-input-field>`
When I wait until element located `<search-button>` appears
When I click on element located `<search-button>`
Then number of elements found by `linkUrlPart(https://www.nfl.com/stats/player-stats/category/rushing/2022/reg/all/rushingyards/desc)->filter.textPart(2022 NFL rushing stats - Players)` is equal to `1`

Scenario: Verify that Emmitt Smith is number one all-time in rushing yards
When I click on element located `<all-time-rush>`
When I wait until element located `<album-description>` contains text 'Take a look at the top 10 all-time rushing leaders in NFL history.'
When I change context to element located `<first-name>`
Then the text 'Emmitt Smith' exists

Scenario: Verify that Barry Sanders is third all-time
When I click on element located `<next-button>`
When I click on element located `<next-button>`
When I change context to element located `<third-name>`
Then the text 'Barry Sanders' exists
