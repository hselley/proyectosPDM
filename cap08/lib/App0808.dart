// App0808.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

const Map<String, String> synopses = {
  'Casablanca': 'This was the first attempt by Warner Brothers to make '
                'the movie classic into a series. It was part of a revolving '
                'group of shows that included Kings Row on a show called Warner '
                'Brothers Presents.',
  'Citizen Kane': 'Newspaper magnate Charles Foster Kane is taken from his mother '
                'as a boy and made the ward of a rich industrialist. As a result, '
                'every well-meaning, tyrannical or self-destructive move he makes '
                'for the rest of his life appears in some way to be a reaction to '
                'that deeply wounding event.',
  'Fight Club': 'A ticking-time-bomb insomniac and a slippery soap salesman channel '
                'primal male aggression into a shocking new form of therapy. Their '
                'concept catches on, with underground "fight clubs" forming in every '
                'town, until an eccentric gets in the way and ignites an out-of-control '
                'spiral toward oblivion.',
  'The Shawshank Redemption': 'Imprisoned in the 1940s for the double murder of his wife '
                'and her lover, upstanding banker Andy Dufresne begins a new life at the '
                'Shawshank prison, where he puts his accounting skills to work for an amoral '
                'warden. During his long stretch in prison, Dufresne comes to be admired by '
                'the other inmates -- including an older prisoner named Red -- for his '
                'integrity and unquenchable sense of hope.',
  'The Truman Show': 'Every second of every day, from the moment he was born, for the last '
                'thirty years, Truman Burbank has been the unwitting star of the longest '
                'running, most popular documentary-soap opera in history. The picture-perfect '
                'town of Seahaven that he calls home is actually a gigantic soundstage. '
                'Truman\'s friends and family - everyone he meets, in fact - are actors. He '
                'lives every moment under the unblinking gaze of thousands of hidden TV cameras.',
  'Eternal Sunshine of the Spotless Mind': 'Joel Barish, heartbroken that his girlfriend underwent '
                'a procedure to erase him from her memory, decides to do the same. However, as he '
                'watches his memories of her fade away, he realises that he still loves her, and may '
                'be too late to correct his mistake.'
};

extension MoreMovieTitlePage on MovieTitlePageState {
  goToDetailPage(String movieName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(),
            settings: RouteSettings(arguments: movieName)
        )
    );
  }

  Widget buildTitlePageCore() {
    return ListView(
      children: [
        ListTile(
          title: Text('Casablanca'),
          onTap: () => goToDetailPage('Casablanca'),
        ),
        ListTile(
          title: Text('Citizen Kane'),
          onTap: () => goToDetailPage('Citizen Kane'),
        ),
        ListTile(
          title: Text('Fight Club'),
          onTap: () => goToDetailPage('Fight Club'),
        ),
        ListTile(
          title: Text('The Shawshank Redemption'),
          onTap: () => goToDetailPage('The Shawshank Redemption'),
        ),
        ListTile(
          title: Text('The Truman Show'),
          onTap: () => goToDetailPage('The Truman Show'),
        ),
        ListTile(
          title: Text('Eternal Sunshine of the Spotless Mind'),
          onTap: () => goToDetailPage('Eternal Sunshine of the Spotless Mind'),
        ),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final movieName = ModalRoute.of(context)?.settings.arguments;
    final overview = '(From themoviedb.com) ${synopses[movieName]}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(overview)
      ],
    );
  }
}