// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sample_crud/contact/shared/contact_provider.dart';
// import 'package:flutter_sample_crud/core/presentation/router/app_router.gr.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// @RoutePage()
// class ContactPage extends ConsumerStatefulWidget {
//   const ContactPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<ContactPage> {
//   // List<Contact> contactList = [];
//   @override
//   void initState() {
//     super.initState();
//     getContacts();
//   }

//   Future<void> getContacts() async {
//     Future.microtask(
//         () => ref.read(contactNotifierProvider.notifier).getContacts());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(contactNotifierProvider);
//     ref.listen(
//       contactNotifierProvider,
//       (previous, next) {
//         next.when(
//           initial: () => debugPrint('contactNotifierProvider/ initial'),
//           loading: () {
//             debugPrint('contactNotifierProvider/ loading');
//             // contactList.clear();
//           },
//           noConnection: () =>
//               debugPrint('contactNotifierProvider/ noConnection'),
//           empty: () => debugPrint('contactNotifierProvider/ empty'),
//           success: (data) {
//             debugPrint('contactNotifierProvider/ success');
//             debugPrint('contactNotifierProvider/ $data');
//             ref.read(contactListProvider).addAll(data);
//             // for (var element in data) {
//             //   contactList.add(element);
//             // }
//           },
//           error: (error) => debugPrint('contactNotifierProvider/ error'),
//         );
//       },
//     );
//     final contactList = ref.watch(contactListProvider.notifier).contacts;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sample CRUD'),
//         actions: [
//           IconButton(
//             onPressed: () =>
//                 ref.read(contactNotifierProvider.notifier).getContacts(),
//             icon: const Icon(Icons.refresh),
//           ),
//         ],
//       ),
//       body: state.when(
//         initial: () => const SizedBox(),
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//         noConnection: () => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'No Connection\nCheck your internet!',
//                 textAlign: TextAlign.center,
//               ),
//               IconButton(
//                   onPressed: () => getContacts(),
//                   icon: const Icon(Icons.refresh))
//             ],
//           ),
//         ),
//         empty: () => const Center(
//           child: Text('No Data'),
//         ),
//         success: (contacts) => ListView.builder(
//           itemCount: contactList.length,
//           itemBuilder: (context, index) => Card(
//             child: ListTile(
//               leading: CircleAvatar(child: Text('${index + 1}')),
//               title: Text(contactList[index].name),
//               subtitle: Text(contactList[index].phone),
//               trailing: IconButton(
//                   onPressed: () {
//                     ref
//                         .read(saveContactNotifierProvider.notifier)
//                         .deleteContact(contactList[index].id);
//                     ref.read(contactListProvider).deleteByIndex(index);
//                     setState(() {
//                       // contactList.removeAt(index);
//                     });
//                   },
//                   icon: const Icon(Icons.delete)),
//               onTap: () => AutoRouter.of(context)
//                   .push(UpdateContactRoute(contact: contactList[index])),
//             ),
//           ),
//         ),
//         error: (error) => const Center(
//           child: Text('Error/nSomething wrong'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => AutoRouter.of(context).push(const AddContactRoute()),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
