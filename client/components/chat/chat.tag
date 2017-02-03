import style from './chat.css';
import 'components/message-feed/message-feed.tag';
import 'components/message-input/message-input.tag';

<chat class={style.root}>
  <message-feed style='height: 90%' />
  <message-input style='height: 5%' />

  <script>
    this.style = style;
  </script>
</chat>

