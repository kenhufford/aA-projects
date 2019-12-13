const APIUtil = require("./api_util.js");

class UserSearch{
    constructor($searchField){
        this.$el = $searchField;
        this.handleInput();
    }

    handleInput(){
        this.$el.keyup((e) => {
            let users = APIUtil.searchUsers(e.key);
            console.log(users);
        });
    }
}

module.exports = UserSearch;