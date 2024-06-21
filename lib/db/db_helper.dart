import 'package:image_search_project/domain/image_document.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  var _db;
  final String searchDataTable = "searchData";
  final String _id = "id";
  final String collection = "collection";
  final String thumbnailUrl = "thumbnail_url";
  final String imageUrl = "image_url";
  final String displaySitename = "display_sitename";
  final String docUrl = "doc_url";
  final String width = "width";
  final String height = "height";
  final String dateTime = "dateTime";
  final String favorite = "favorite";
  final String databaseName = "SearchData.db";

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        return db.execute(
          "CREATE TABLE $searchDataTable($_id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "$collection TEXT, $thumbnailUrl TEXT, $imageUrl TEXT, $displaySitename TEXT, $docUrl TEXT,"
          "$width INTEGER, $height INTEGER, $favorite INTEGER, $dateTime String)",
        );
      },
      version: 1,
    );
    return _db;
  }

  Future insertSearchData(ImageDocument item) async {
    final db = await database;

    await db.insert(
      searchDataTable,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future insertAllSearchData(List<ImageDocument> items) async {
    final db = await database;

    for (var item in items) {
      await db.insert(
        searchDataTable,
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<ImageDocument> getImageDocument(int id) async {
    final db = await database;
    var result = await db
        .rawQuery("SELECT * FROM $searchDataTable WHERE $_id = ?", [id]);

    id = int.parse(result.first[_id].toString());
    String collection = result.first[this.collection].toString();
    String thumbnailUrl = result.first[this.thumbnailUrl].toString();
    String imageUrl = result.first[this.imageUrl].toString();
    String displaySitename = result.first[this.displaySitename].toString();
    String docUrl = result.first[this.docUrl].toString();
    int width = int.parse(result.first[this.width].toString());
    int height = int.parse(result.first[this.height].toString());
    bool favorite = result.first[this.favorite].toString() == '1';
    String dateTime = result.first[this.dateTime].toString();

    var imageDocument = ImageDocument(
        id: id,
        collection: collection,
        thumbnailUrl: thumbnailUrl,
        imageUrl: imageUrl,
        displaySitename: displaySitename,
        docUrl: docUrl,
        width: width,
        height: height,
        dateTime: dateTime,
        isFavorite: favorite);

    return imageDocument;
  }

  Future<List<ImageDocument>> getAllImageDocument() async {
    final db = await database;
    final List<Map<String, dynamic>> searchData =
        await db.query(searchDataTable);

    return List.generate(searchData.length, (index) {
      Map<String, dynamic> data = searchData[index];
      int id = data[_id];
      String collection = data[this.collection].toString();
      String thumbnailUrl = data[this.thumbnailUrl].toString();
      String imageUrl = data[this.imageUrl].toString();
      String displaySitename = data[this.displaySitename].toString();
      String docUrl = data[this.docUrl].toString();
      int width = int.parse(data[this.width].toString());
      int height = int.parse(data[this.height].toString());
      String dateTime = data[this.dateTime].toString();
      bool favorite = data[this.favorite].toString() == '1';

      var imageDocument = ImageDocument(
          id: id,
          collection: collection,
          thumbnailUrl: thumbnailUrl,
          imageUrl: imageUrl,
          displaySitename: displaySitename,
          docUrl: docUrl,
          width: width,
          height: height,
          dateTime: dateTime,
          isFavorite: favorite);

      return imageDocument;
    });
  }

  Future<void> updateImageDocument(ImageDocument data) async {
    final db = await database;
    await db.update(
      searchDataTable,
      data.toMap(),
      where: "$_id = ?",
      whereArgs: [data.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAllSearchData() async {
    final db = await database;
    await db.delete(searchDataTable);
  }
}
