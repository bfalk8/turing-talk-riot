import style from './turing-talk.css';
import MessageStore from 'stores/MessageStore';
// import 'components/chat/chat.tag';
// import 'components/enigma-settings/enigma-settings.tag';
import 'components/switcher/switcher.tag';

<turing-talk>
  <h1 class={style.title}>Turing Talk!</h1>
  <div class={style.row}>
    <div class={style.chatDesc}>
      <p>Encrypted messages over the wire like it's the 1940's...</p>
    </div>
    <switcher class={style.chat} />
  </div>

  <script>
    this.style = style;

    this.on('mount', () => {
      riot.control.addStore(new MessageStore());
    });
  </script>
</turing-talk>
