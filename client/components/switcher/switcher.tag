import style from './switcher.css';

import 'components/chat/chat.tag';
import 'components/enigma-settings/enigma-settings.tag';

<switcher>
  <div class={style.floatwrap} onclick={handleClickToggle}>
    {floatText}
  </div>

  <div class={ showChat ? style.show : style.hide } style='height: 90%'>
    <chat ref='chat' />
  </div>
  <div class={ showSettings ? style.show : style.hide }>
    <enigma-settings ref='settings' />
  </div>

  <script>
    this.style = style;

    this.showChat = true;
    this.showSettings = false;
    this.floatText = 'Settings';

    this.handleClickChat = () => {
      this.showChat = true;
      this.showSettings = false;
    }

    this.handleClickSettings = () => {
      this.showChat = false;
      this.showSettings = true;
    }

    this.handleClickToggle = () => {
      this.showChat = !this.showChat;
      this.showSettings = !this.showSettings;
      this.floatText = this.showSettings ? 'Chat' : 'Settings';
    }
  </script>
</switcher>
