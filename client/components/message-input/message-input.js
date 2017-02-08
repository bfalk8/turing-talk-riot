export function handleKeyPress(e) {
  if(e.keyCode === 13) {
    riot.control.trigger('message.send', this.refs.input.value);
    this.refs.input.value = '';
  }
}

export function handleBtnPress() {
  riot.control.trigger('message.send', this.refs.input.value);
  this.refs.input.value = '';
}
