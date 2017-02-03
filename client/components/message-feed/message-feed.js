export function update() {
  if(this.shouldScroll) {
    this.refs.feed.scrollTop = this.refs.feed.scrollHeight;
  }
}
export function handleScroll(elem) {
  this.shouldScroll = elem.target.scrollHeight - elem.target.scrollTop === elem.target.clientHeight;
}

export function updateMessages(messages) {
  this.messages = messages;
  // this.update();
}
