import style from './test-module.css';
// import 'components/message-feed/message-feed.tag';
// import 'components/message-input/message-input.tag';
import 'components/chat/chat.tag';
import 'components/enigma-settings/enigma-settings.tag';
import SocketHandler from 'SocketHandler';
 
<test-module>
  <button onclick={handleClick} style='cursor: pointer; border: 1px; background-color: blue; color: white; width: 100px' ref='switchbtn'>
    settings?
  </button>

  <div>
    <chat ref='chat' style='position: static; top: -9999px; left: -9999px'/>
    <enigma-settings ref='settings' style='position: absolute; top: -9999px; left: -9999px' />
  </div>
  <script>
    this.style = style;
    this.check = true;

    this.on('mount', () => {
      this.socket = new SocketHandler();
    });

    this.handleClick = (e) => {
      if(this.check) {
        this.refs.chat.root.style.position = 'absolute';
        this.refs.settings.root.style.position = 'static';
        this.refs.switchbtn.style.backgroundColor = 'red';
        this.refs.switchbtn.innerHTML = 'chat';
      } else {
        this.refs.chat.root.style.position = 'static';
        this.refs.settings.root.style.position = 'absolute';
        this.refs.switchbtn.style.backgroundColor = 'blue';
        this.refs.switchbtn.innerHTML = 'settings?';
      }
      // if(this.check) {
      //   this.refs.chat.root.style.display = 'none';
      //   this.refs.settings.root.style.display = 'block';
      // } else {
      //   this.refs.chat.root.style.display = 'block';
      //   this.refs.settings.root.style.display = 'none';
      // }
      this.check = !this.check;
    }
  </script>

</test-module>
