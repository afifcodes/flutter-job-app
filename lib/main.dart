import 'package:flutter/material.dart';
import 'package:flutter_job_app/models/job.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final List<Job> _jobs = [
    Job(
        title: 'Senior UI/UX Designer',
        companyName: 'Google',
        image: 'Google',
        workHour: 'Full Time Job',
        minSal: 240,
        maxSal: 280,
        minExp: 5),
    Job(
        title: 'UI/UX Designer',
        companyName: 'Apple',
        image: 'Apple',
        workHour: 'Full Time Job',
        minSal: 80,
        maxSal: 90,
        minExp: 1),
    Job(
        title: 'UX Research Intern',
        companyName: 'Reddit',
        image: 'Reddit',
        workHour: 'Internship',
        minSal: 40,
        maxSal: 50,
        minExp: 1),
    Job(
        title: 'Product Designer',
        companyName: 'Dribbble',
        image: 'Dribbble',
        workHour: 'Full Time Job',
        minSal: 60,
        maxSal: 85,
        minExp: 1),
    Job(
        title: 'Senior Product Designer',
        companyName: 'Figma',
        image: 'Figma',
        workHour: 'Full Time Job',
        minSal: 80,
        maxSal: 180,
        minExp: 3),
    Job(
        title: 'Software Developer Intern',
        companyName: 'Adobe',
        image: 'Adobe',
        workHour: 'Internship',
        minSal: 50,
        maxSal: 60,
        minExp: 1),
    Job(
        title: 'UX Design Intern',
        companyName: 'GitHub',
        image: 'GitHub',
        workHour: 'Internship',
        minSal: 40,
        maxSal: 50,
        minExp: 1),
    Job(
        title: 'Web Developer',
        companyName: 'Notion',
        image: 'Notion',
        workHour: 'Full Time Job',
        minSal: 80,
        maxSal: 100,
        minExp: 1),
    Job(
        title: 'Mobile App Developer',
        companyName: 'Tiktok',
        image: 'TikTok',
        workHour: 'Full Time Job',
        minSal: 100,
        maxSal: 120,
        minExp: 2),
    Job(
        title: 'Senior Software Engineer Lead',
        companyName: 'Microsoft',
        image: 'Microsoft',
        workHour: 'Full Time Job',
        minSal: 200,
        maxSal: 250,
        minExp: 5),
    Job(
        title: 'Software Engineer Intern',
        companyName: 'PayPal',
        image: 'PayPal',
        workHour: 'Internship',
        minSal: 50,
        maxSal: 55,
        minExp: 1),
    Job(
        title: 'UX Researcher',
        companyName: 'Instagram',
        image: 'Instagram',
        workHour: 'Full Time Job',
        minSal: 160,
        maxSal: 200,
        minExp: 4),
    Job(
        title: 'Security Software Engineer',
        companyName: 'Netflix',
        image: 'Netflix',
        workHour: 'Full Time Job',
        minSal: 150,
        maxSal: 200,
        minExp: 4),
    Job(
        title: 'Data Scientist - SMB',
        companyName: 'Twitter',
        image: 'Twitter',
        workHour: 'Full Time Job',
        minSal: 140,
        maxSal: 160,
        minExp: 3),
  ];
  late List<Job> displayJobs;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    displayJobs = _jobs;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12)),
        child: TextField(
          controller: _searchController,
          onChanged: (v) {
            setState(() {
              displayJobs = v != ''
                  ? _jobs.where((u) => u.title!.contains(v)).toList()
                  : _jobs;
            });
          },
          style: GoogleFonts.inter(),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              hintText: 'Search',
              hintStyle: GoogleFonts.inter(),
              suffixIconConstraints: const BoxConstraints(
                  minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36),
              contentPadding: const EdgeInsets.only(
                  right: 20, left: 20, top: 10, bottom: 12),
              suffixIcon: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.text = '';
                          displayJobs = _jobs;
                        });
                      },
                      child: const Icon(Icons.close))
                  : null),
        ),
      ),
    );
  }

  Widget card({Job? job}) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 1)
          ]),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset('assets/images/${job?.image}.png'),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job!.title!,
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                    '${job.companyName} | \$${job.minSal}-\$${job.maxSal}K/year',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800)),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Experience: ${job.minExp} Years',
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        job.workHour!,
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 24),
          physics: const BouncingScrollPhysics(),
          itemCount: displayJobs.length,
          itemBuilder: (context, index) {
            return card(job: displayJobs[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
        ));
  }
}
