export function handleKeyPress(e) {
  if(e.key === 'Enter') {
    riot.control.trigger('message.send', this.refs.input.value);
    this.refs.input.value = '';
  }
}
