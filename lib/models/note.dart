class Note {

  Note({this.title, this.content, this.items = const <NoteItem>[]});

  String title;
  String content;
  List<NoteItem> items;
}

abstract class NoteItem{ }

class NoteItemText extends NoteItem {
  NoteItemText({this.text});
  String text;
}

class NoteItemImage extends NoteItem {
  NoteItemImage({this.url});
  String url;
}

class NoteItemRow extends NoteItem {

  NoteItemRow({this.notesItems = const <NoteItem>[] });

  List<NoteItem> notesItems;
}