const FollowToggle = require("./follow_toggle.js");
const UserSearch = require("./user_search.js");

$(document).ready( () => {
    const $buttons = $(".follow-toggle");
    const $searchField = $(".user-search-input");
    console.log("ready!");
    new UserSearch($searchField);
    $buttons.each((i, button) => {
        new FollowToggle($(button));
    });
    
})
    
