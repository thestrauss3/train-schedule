import React, { Component } from 'react';
import 'whatwg-fetch';

class ScheduleHeader extends Component {
  constructor(props) {
    super(props);

    this.state = {
      favorite: false
    }

    this.fetchFavorite = this.fetchFavorite.bind(this);
    this.handleFavoriteTrainToggle = this.handleFavoriteTrainToggle.bind(this);
    this.isCurrentTrainFavorite = this.isCurrentTrainFavorite.bind(this);
  }

  componentDidMount() {
    this.isCurrentTrainFavorite();
  }

  handleFavoriteTrainToggle() {
    this.fetchFavorite("true");
  }

  isCurrentTrainFavorite() {
    this.fetchFavorite("false");
  }

  fetchFavorite(toggleFav) {
    fetch(`/api/v1/users/toggle_favorite_train?train=${this.props.num}&toggle=${toggleFav}&route=${this.props.route}`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(body => {
      this.setState({ favorite: body });
    });
  }

  render() {
    let favIcon;
    let favClass;
    if (this.state.favorite && this.props.currentUser) {
      favIcon = <img className="fav-star" src={assetHelper["gold-star-icon"]}></img>
      favClass = " favorite"

    } else if (this.props.currentUser) {
      favIcon = <img className="fav-star" src={assetHelper["black-star-icon"]}></img>
      favClass = ""
    }
    return (
      <th onClick={ this.handleFavoriteTrainToggle }className={`schedule-header-column ${favClass}`}>{ this.props.num }<br/>{favIcon}</th>
    )
  }
}

export default ScheduleHeader;
