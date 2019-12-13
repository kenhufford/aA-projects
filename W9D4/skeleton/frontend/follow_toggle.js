const APIUtil = require('./api_util.js');

class FollowToggle{
    constructor($button){
        this.userId = $button.data("user-id");
        this.initialFollowState = $button.data("initial-follow-state");
        this.$el = $button;
        this.toggleFollowState = this.toggleFollowState.bind(this);
        this.toggleDisable = this.toggleDisable.bind(this);
        this.toggleEnable = this.toggleEnable.bind(this);
        this.handleClick();
    }

    render(){
        if (this.initialFollowState){
            this.$el.text("Unfollow");
        } else {
            this.$el.text("Follow");
        }
    }

    toggleFollowState(){
        (this.initialFollowState) ? this.initialFollowState = false : this.initialFollowState = true;
        this.render();
    }

    toggleDisable (){
        if(this.initialFollowState){
            this.$el.text("Unfollowing...");
        } else {
            this.$el.text("Following...");
        }
        
       this.$el.prop("disabled", true);
    }
    toggleEnable (){
       this.$el.prop("disabled", false);
    }

    handleClick(){
        this.$el.on('click', (e) => {
            e.preventDefault();
            this.toggleDisable();
            if ( this.initialFollowState === false ){
                APIUtil[`followUser`](this.userId)
                    .then(this.toggleFollowState)
                    .then(this.toggleEnable);
                
            }else{
                APIUtil[`unfollowUser`](this.userId)
                    .then(this.toggleFollowState)
                    .then(this.toggleEnable);
            }

        });
    }
    
}

module.exports = FollowToggle;