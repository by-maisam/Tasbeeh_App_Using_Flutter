import 'package:flutter/material.dart';

class ZikrListpage extends StatefulWidget {
  const ZikrListpage({super.key});

  @override
  State<ZikrListpage> createState() => _ZikrListpageState();
}

class _ZikrListpageState extends State<ZikrListpage> {
  List<String> zikrlist = [
    "Alhamdulilah",
    "SubhanAllah",
    "Allah O Akbar",
    "MashaAllah",
    "inshaAllah",
  ];
  var zikrTextController = TextEditingController();

  void addOrEditItem({int index = -1}) {
    if (index != -1) {
      zikrTextController.text = zikrlist[index];
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: zikrTextController,
                decoration: InputDecoration(labelText: "Add Zikr Here "),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    String zikr = zikrTextController.text.trim();

                    if (zikr.isNotEmpty) {
                      setState(() {
                        if (index == -1) {
                          zikrlist.add(zikr);
                        } else {
                          zikrlist[index] = zikr;
                        }
                      });

                      zikrTextController.clear();
                    }
                  },
                  label: Text("Save"),
                  icon: Icon(Icons.check),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: zikrlist.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                          ),
                          child: Icon(
                            Icons.circle_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(
                          zikrlist[index],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Spacer(),
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Text("Edit"),
                                onTap: () {
                                  addOrEditItem(index: index);
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () {
                                  setState(() {
                                    zikrlist.removeAt(index);
                                  });
                                },
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          FilledButton.icon(
            onPressed: () {
              addOrEditItem();
            },
            label: Text("Add New Zikr"),
            icon: Icon(Icons.add),
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
