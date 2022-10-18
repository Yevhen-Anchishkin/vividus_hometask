Description: Trying out VIVIDUS syntax

Lifecycle:
Examples:
{transformer=FROM_LANDSCAPE}
|search-input-field |By.fieldName(q)                 |
|search-button      |By.xpath((//*[@name='btnK'])[1])|

Scenario:
Given I am on a page with the URL 'https://www.google.com/'
When I enter `NFL rushing leader` in field located `search-input-field `
When I wait until element located `<search-button>` appears
When I click on element located `<search-button>`
Then number of elements found by `linkUrlPart(https://www.nfl.com/stats/player-stats/category/rushing/2022/reg/all/rushingyards/desc)->filter.textPart(2022 NFL rushing stats - Players)` is equal to `1`