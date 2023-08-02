import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/ui/tab_admin/categories/sub_screens/category_add_screen.dart';
import '../../../data/models/category/category_model.dart';
import '../../../providers/category_provider.dart';

class CategoriesScreenAdmin extends StatefulWidget {
  const CategoriesScreenAdmin({super.key});

  @override
  State<CategoriesScreenAdmin> createState() => _CategoriesScreenAdminState();
}

class _CategoriesScreenAdminState extends State<CategoriesScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Categories Admin"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CategoryAddScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        CategoryModel categoryModel = snapshot.data![index];
                        return ListTile(
                          leading: Container(
                            decoration: BoxDecoration(border: Border.all(color:  Colors.black)),
                            child: Image.network(
                              categoryModel.imageUrl,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          onLongPress: () {
                            context.read<CategoryProvider>().deleteCategory(
                                  context: context,
                                  categoryId: categoryModel.categoryId,
                                );
                          },
                          title: Text(categoryModel.categoryName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                          subtitle: Text(categoryModel.description,style: const TextStyle(color: Colors.black)),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CategoryAddScreen(
                                      categoryModel: categoryModel,
                                    );
                                  },
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit,color: Colors.black,),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: Text("Empty!"));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
