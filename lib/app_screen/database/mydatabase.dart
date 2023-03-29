import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/app_screen/database/Picture.dart';
class SqlDb{
  static Database ? _db;
  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String TABLE = 'PhotosTable';
  static const String DB_NAME = 'photos.db';
  Future<Database?> get db async{
    if(_db==null){
      _db=await intialDb();
      return _db;
    }else {
      return _db;
    }
  }
  intialDb() async {
    String databasepath=await getDatabasesPath();
    String path=join(databasepath, "osama.db");
    Database mydb=await openDatabase(path,onCreate: _onCreate,onUpgrade: _onUpgrade,version: 1);
    return mydb;
  }
  _onCreate(Database db,int version) async {
    Batch batch =db.batch();
    batch.execute('''
    CREATE TABLE "notes"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "note" TEXT 
    )
    ''');
    batch.execute('''
    CREATE TABLE "noteBook"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "namePhoto" TEXT,
    "date" TEXT NOT NULL,
    "note" TEXT 
    )
    ''');
    batch.execute('''CREATE TABLE "bookmark" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "date" TEXT NUT NULL,
    "note" TEXT
    )''');
    batch.execute('''CREATE TABLE "Picture" (
    "id" INTEGER PRIMARY KEY,
    "image" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "userName" TEXT NOT NULL
    )''');
    // await db.execute("CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)");
    await batch.commit();
    print("_onCreate ============================================ ");
  }
  _onUpgrade(Database db,int oldVersion,int newVersion) async{
    print("_onUpgrade======================");
  }
  readData (String sql) async{
    Database? mydb=await db;
    List<Map> response=await mydb!.rawQuery(sql);
    return response;
  }
  deleteData (String sql )async {
    Database ? mydb=await db;
    int response =await mydb!.rawDelete(sql);
    return response;
  }
  updateData (String sql) async{
    Database ? mydb=await db;
    int response=await mydb!.rawUpdate(sql);
    return response;
  }
  insertData(String sql)async{
    Database ? mydb=await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }



}


