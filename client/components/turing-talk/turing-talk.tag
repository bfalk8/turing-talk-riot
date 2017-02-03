import style from './turing-talk.css';
import SocketHandler from 'SocketHandler';
import 'components/chat/chat.tag';

<turing-talk>
  <h1 class={style.title}>Turing Talk!</h1>
  <chat style='height: 90%'/>

  <script>
    this.style = style;
    this.on('mount', () => {
      this.socket = new SocketHandler();
    });
  </script>
</turing-talk>
