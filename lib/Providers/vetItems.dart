import 'package:animal_app/Models/ngoItem.dart';
import 'package:animal_app/Models/vetItem.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VetItems with ChangeNotifier {
  List<VetItem> _items = [];

  Future<void> itemsBuilder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _items = [
      VetItem(
          id: 'v1',
          name: "Dr. Choudhary's Pet Clinic",
          phoneNumber: ["01124113000"],
          isFavourite: prefs.getBool('v1-isFavourite') ?? false,
          doctors: ["Dr. S.K. Choudhary", "Dr. P Choudhary"],
          address: "DDA Market Anand Niketan",
          longAddress:
              "Ground, Shop no.31, Lower, DDA Market Rd, near SBI, Anand Niketan, New Delhi, Delhi",
          lat: 28.578975993354604,
          long: 77.16484354855814,
          timings: "10AM - 1PM & 5PM - 8PM",
          description:
              "The clinic has an experienced and qualified team of professionals and functions as a resource centre, empowering people to make informed decisions about the care of their animals.",
          animalSettings: [AnimalSettings.All],
          rating: "4.3 out of 5",
          ratingSource: "Google"),
      VetItem(
        id: 'v2',
        name: "Dr. Kharb's Pet Clinic & Surgery",
        phoneNumber: ["08042783431"],
        isFavourite: prefs.getBool('v2-isFavourite') ?? false,
        doctors: [
          "Maj Gen (Retd) Dr. RM Kharb",
          "Dr. Ranjit Kharb",
          "Dr. Moshumi Rao Kharb"
        ],
        address: "3, Shopping Complex, Munirka Vihar DDA Market",
        longAddress:
            "3, Shopping Complex, Munirka Vihar DDA Market, Nelson Mandela Marg, New Delhi, Delhi",
        lat: 28.554399546358912,
        long: 77.16673501073238,
        timings: "10AM - 12:30AM",
        description:
            "The services offered include laser therapy, X-ray services, and general routine/special surgeries ",
        animalSettings: [AnimalSettings.All],
      ),
      VetItem(
        id: "v3",
        name: "New Delhi Veterinary Clinic",
        doctors: ["Dr. Ajay Rana"],
        timings: "10AM - 8PM (Monday to Saturday)",
        description:
            "Some of the services provided by the clinic are: Pet Grooming, Homeopathic Treatment for Pets, Birds Treatment, Large Animal Treatment and Pet Scans etc.",
        animalSettings: [
          AnimalSettings.Birds,
          AnimalSettings.Cats,
          AnimalSettings.Dogs
        ],
        phoneNumber: ["01140036724"],
        isFavourite: prefs.getBool('v3-isFavourite') ?? false,
        address: "Kailash Colony, Delhi",
        longAddress:
            "Shop Number 48, Ajit Arcade, Kailash Colony; Above Universal Tyre House & Near LSR College, Opposite Metro Piller No.74, Delhi",
        lat: 28.564233332180436,
        long: 77.24141071682847,
        rating: "4.7 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v4",
        name: "Dr. Rana Pet Clinic",
        doctors: ["Dr. Pradeep Rana"],
        address: "Neeti Bagh-south Extension 2",
        longAddress:
            "Niti Bagh Pet Clinic, Shop No-5, Neeti Bagh-south Extension 2, Delhi; Near DDA Market ",
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        phoneNumber: ["01126866676"],
        isFavourite: prefs.getBool('v4-isFavourite') ?? false,
        lat: 28.56385213884902,
        long: 77.21589614737059,
        rating: "4.5 out of 5",
        ratingSource: "Just Dial",
        timings: "9:30 AM - 8:30 PM (Monday to Saturday)",
        description:
            "Dr. Rana is one of the best veterinary doctors the city has. Taking complete care of the patients and providing comprehensive care, the doctor's facility is one well-maintained centre which is equipped with all the necessary medical equipment",
      ),
      VetItem(
        id: "v5",
        address: "East of Kailash",
        name: "Dr. Gandhi’s Pet Hospital",
        animalSettings: [
          AnimalSettings.Birds,
          AnimalSettings.Cats,
          AnimalSettings.Dogs
        ],
        doctors: ["Dr. Narendra Gandhi", "Dr. Vivek Arora"],
        lat: 28.557297265691123,
        long: 77.24310248835643,
        longAddress:
            "No. 11, DDA Mini Market, Block E, East of Kailash, New Delhi",
        phoneNumber: ["01126235501"],
        timings: "9:30 AM - 8:00 PM (Monday to Saturday)",
        description:
            "Dr. Gandhi's Pet Hospital is known for housing experienced Veterinarians. Dr.Narendra Gandhi, a well-reputed Veterinarian, practices in Delhi.",
        isFavourite: prefs.getBool('v5-isFavourite') ?? false,
        rating: "3.9 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v6",
        address: "East of Kailash",
        name: "Max Vets - East of Kailash",
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        doctors: [
          "Dr. Manmohan Sharma",
          "Dr. Kunal Dev Sharma",
          "Dr. Bhanu Dev Sharma",
          "Dr. Sunaina Gupta",
          "Dr. Dhiraj Gaur",
          "Dr. Mohit Gajwani",
          "Dr. Sudhir Singh",
          "Dr. Akhiyar Khan"
        ],
        lat: 28.562424112266225,
        long: 77.23935078038497,
        longAddress:
            "Metro Pillar Number 74, E-8, Block E, East of Kailash, New Delhi",
        phoneNumber: ["08448449955"],
        timings: "Operates 24/7",
        description:
            "Max Vets strives to provide high quality veterinary service in a personable and accommodating manner by consistently focusing on accurate and effective communication, compassionate treatment of animals, and client education.",
        isFavourite: prefs.getBool('v6-isFavourite') ?? false,
        rating: "4 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v7",
        address: "Greater Kailash 1",
        name: "Max Vets - Greater Kailash",
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        doctors: [
          "Dr. Manmohan Sharma",
          "Dr. Kunal Dev Sharma",
          "Dr. Bhanu Dev Sharma",
          "Dr. Sunaina Gupta",
          "Dr. Dhiraj Gaur",
          "Dr. Mohit Gajwani",
          "Dr. Sudhir Singh",
          "Dr. Akhiyar Khan"
        ],
        lat: 28.548849670738765,
        long: 77.24213254972672,
        longAddress:
            "R-55, Chirag Enclave Main Rd, Greater Kailash-1, New Delhi",
        phoneNumber: ["08448449955"],
        timings: "10 AM - 7 PM (Monday to Saturday)",
        description:
            "Max Vets strives to provide high quality veterinary service in a personable and accommodating manner by consistently focusing on accurate and effective communication, compassionate treatment of animals, and client education.",
        isFavourite: prefs.getBool('v7-isFavourite') ?? false,
        rating: "4 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v8",
        address: "Sector 3B, Rohini",
        name: "Max Vets - Rohini",
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        doctors: [
          "Dr. Manmohan Sharma",
          "Dr. Kunal Dev Sharma",
          "Dr. Bhanu Dev Sharma",
          "Dr. Sunaina Gupta",
          "Dr. Dhiraj Gaur",
          "Dr. Mohit Gajwani",
          "Dr. Sudhir Singh",
          "Dr. Akhiyar Khan"
        ],
        lat: 28.70203330000215,
        long: 77.11207850430193,
        longAddress:
            "B-10/10 Sec-3, Rohini, opposite Punjab and Sindh Bank, Jaipur Golden Hospital Road, New Delhi",
        phoneNumber: ["08448449955"],
        timings: "10 AM - 2 PM, 3 PM - 7PM (Monday to Saturday)",
        description:
            "Max Vets strives to provide high quality veterinary service in a personable and accommodating manner by consistently focusing on accurate and effective communication, compassionate treatment of animals, and client education.",
        isFavourite: prefs.getBool('v8-isFavourite') ?? false,
        rating: "4.2 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v9",
        name: "Noida Pet Clinic",
        doctors: ["Dr. Praveen Dutt Sharma"],
        address: "C-105, Sector-72, Noida",
        longAddress: "C-105, Sector-72, Noida",
        lat: 28.587714503270053,
        long: 77.37956754171718,
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        phoneNumber: ["9810425565"],
        timings: "10 AM - 9 PM (Monday to Sunday)",
        description:
            "The clinic achieves customer satisfaction through preventive health care services using highly advance veterinary facilities at minimum affordable cost.",
        isFavourite: prefs.getBool('v9-isFavourite') ?? false,
        rating: "3.5 out of 5",
        ratingSource: "Practo",
      ),
      VetItem(
        id: "v10",
        name: "CGS Veterinary Hospital",
        doctors: [
          "Dr. Vikash Singh Chauhan",
          "Dr. Vaibhav Bishnoi",
          "Dr. Salisha Whitney Correia",
          "Dr. Nitish Mishra"
        ],
        address: "DLF Phase- 3",
        longAddress: "S - 25, Site No. 2204, DLF Phase- 3, Gurgaon, Haryana.",
        lat: 28.48455485153441,
        long: 77.10334555503364,
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        phoneNumber: ["08826005582"],
        timings: "8 AM - 7 PM (Open from 7 PM to 8 AM for emergencies)",
        description:
            "CGS Hospital consistently strives to deliver comprehensive medical facilities and patient care with the emphasis on exceptional client services.",
        isFavourite: prefs.getBool('v10-isFavourite') ?? false,
        rating: "4.3 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v11",
        name: "Cure and Care Pet Clinic",
        doctors: [
          "Dr. Sunita Nauriyal",
          "Dr. Sanjib Kakoty",
          "Dr. Pritam Chakravarty"
        ],
        address: "G 2-3, Shokeen Plaza",
        longAddress:
            "G 2-3, Shokeen Plaza, Plot No 3, Pocket 7, Sector 12, Dwarka, New Delhi",
        lat: 28.590616783190722,
        long: 77.04426022327027,
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        phoneNumber: ["9311199053"],
        timings: "9:30AM – 1:30PM, 4:30PM – 7:30PM",
        description:
            "Cure and Care aims to provide clients with premium and competent veterinary services accompanied with dedicated, sympathetic, and complete pet care in a hygienic environment.",
        isFavourite: prefs.getBool('v11-isFavourite') ?? false,
        rating: "4.5 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v12",
        name: "Alphapet",
        doctors: [
          "Dr. R. S. Chaggar",
          "Dr. Rupali Saxena",
          "Dr. Amit Khajuria"
        ],
        address: "B2, Delhi Jal Board Rd",
        longAddress:
            "B2, Delhi Jal Board Rd, Pocket 2, Sector B, Vasant Kunj, New Delhi",
        lat: 28.524822702742195,
        long: 77.15967454888822,
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        phoneNumber: ["9555389089"],
        timings: "9AM - 8PM",
        description:
            "With an aim to modernize the pet healthcare industry in the country, Alphapet is the solution for all of your pet care needs. It delivers cutting-edge healthcare services, supported by excellent facilities and state-of-the art equipment, aided by a wonderful team of experienced veterinarians and compassionate staff.",
        isFavourite: prefs.getBool('v12-isFavourite') ?? false,
        rating: "4.1 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v13",
        name: "Friendly Paws Pet Clinic",
        doctors: [],
        address: "Shop No 6 A, Main Rd, Khyber Pass, Civil Lines",
        longAddress: "Shop No 6 A, Main Rd, Khyber Pass, Civil Lines, Delhi",
        lat: 28.69179371491858,
        long: 77.22119961875717,
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        phoneNumber: ["9999719379"],
        timings: "10AM - 9PM",
        description:
            "The aim of Friendly Paws is to provide the best possible treatment for companion animals and support for their owners, in a friendly and caring environment.",
        isFavourite: prefs.getBool('v13-isFavourite') ?? false,
        rating: "4.5 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v14",
        name: "Amrita Pet Care Clinic",
        doctors: ["Dr. Gautam Unny"],
        address: "G-6, G-13, Vardhman Market",
        longAddress:
            "G-6, G-13, Vardhman Market, Ram Vihar, Opposite Anand Vihar Petrol Pump, New Delhi",
        lat: 28.65910599706903,
        long: 77.30939194374477,
        animalSettings: [AnimalSettings.Dogs],
        phoneNumber: ["01143086626"],
        timings: "9:30AM – 1:00PM, 5:30PM – 8:00PM",
        description:
            "Today with more than a thousand regular pets on its roll, the Amrita Pet Care Clinic is one of the leading clinics in East Delhi.",
        isFavourite: prefs.getBool('v14-isFavourite') ?? false,
        rating: "4.5 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v15",
        name: "Pet Care Clinic",
        doctors: ["Dr. Satish Yadav"],
        address: "D-451, near Ramphal Chowk, Palam Extension",
        longAddress:
            "D-451, near Ramphal Chowk, Palam Extension, Block D, Sector 7 Dwarka, Palam Colony, New Delhi",
        lat: 28.585001784976118,
        long: 77.07009521908876,
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        phoneNumber: ["9910471393"],
        timings: "9AM - 2PM, 5PM - 9PM",
        description:
            "Pet Care Hospital's mission is to provide excellent 360-degree veterinary solutions to the health problems of animals, with patient care and client experience being prime on our agenda.",
        isFavourite: prefs.getBool('v15-isFavourite') ?? false,
        rating: "4.1 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v16",
        name: "Dr. Anand's Pet Clinic - Vikas Puri",
        doctors: ["Dr. R.K. Anand", "Dr. Gautam Anand", "Dr. Manu Mishra"],
        address: "56 & 58, 1st Floor, DDA Local Shopping Centre",
        longAddress:
            "56 & 58, 1st Floor, DDA Local Shopping Centre, Block - J, Vikas Puri, New Delhi",
        lat: 28.64214911209804,
        long: 77.07977532131251,
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        phoneNumber: ["01128543773"],
        timings: "10:00AM – 2:30PM, 6:30PM – 9:30PM",
        description:
            "Dr. Anand’s Pets Clinic in Delhi has been serving the pet population of Delhi & NCR for the last 34 years with utmost dedication and sincerity. It is run by a team of dedicated veterinary professionals under the inspirational leadership of Dr. R.K. Anand. Dr. Anand is a senior veterinary consultant with 50 years of experience in the field of veterinary medicine and is a master in the diagnosis of tick borne and skin diseases.",
        isFavourite: prefs.getBool('v16-isFavourite') ?? false,
        rating: "3.5 of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v17",
        name: "Dr. Anand's Pet Clinic - Janakpuri",
        doctors: ["Dr. R.K. Anand", "Dr. Gautam Anand", "Dr. Manu Mishra"],
        address: "C-2-C/132, Pocket 12, Main Road C-2-B to Dabri Mor",
        longAddress:
            "C-2-C/132, Pocket 12, Main Road C-2-B to Dabri Mor, Janakpuri, New Delhi",
        lat: 28.615323873681252,
        long: 77.08733872420787,
        animalSettings: [AnimalSettings.Cats, AnimalSettings.Dogs],
        phoneNumber: ["01125552500"],
        timings: "10AM – 2PM, 6PM – 9PM",
        description:
            "Dr. Anand’s Pets Clinic in Delhi has been serving the pet population of Delhi & NCR for the last 34 years with utmost dedication and sincerity. It is run by a team of dedicated veterinary professionals under the inspirational leadership of Dr. R.K. Anand. Dr. Anand is a senior veterinary consultant with 50 years of experience in the field of veterinary medicine and is a master in the diagnosis of tick borne and skin diseases.",
        isFavourite: prefs.getBool('v17-isFavourite') ?? false,
        rating: "4 out of 5",
        ratingSource: "Google",
      ),
      VetItem(
        id: "v18",
        name: "Lifeline Veterinary Clinic",
        lat: 28.4854642788526,
        long: 77.1877316330709,
        address: "Satbari",
        longAddress:
            "Tanwar Complex, New, Ansal Villas, Sat Bari, New Delhi, Delhi 110074",
        rating: "4.4 out of 5",
        ratingSource: "Just Dial",
        doctors: ['Dr. Avesh Kumar Singh'],
        phoneNumber: ['8826529791'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Dr Avesh is methodical in his approach.  You can also pay online for his services and he sends periodic reminders for your pets’ pending annual vaccinations.",
        timings:
            "Monday - Saturday: 10:00AM - 9:00PM; Sunday: 10:00AM - 2:00PM",
        isFavourite: prefs.getBool('v18-isFavourite') ?? false,
      ),
      VetItem(
        id: "v19",
        name: "Dr. RT Sharma's Clinic",
        lat: 28.5270388674607,
        long: 77.1519214821205,
        address: "Vasant Kunj",
        longAddress:
            "C9/7, near Guardian Pharmacy, Masoodpur, Sector B, Vasant Kunj, New Delhi",
        rating: "3.4 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. RT Sharma', 'Dr. Vipin Sharma', 'Dr. Ankush'],
        phoneNumber: ['01126136435'],
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        description:
            "Pet Hospital & Boarding Shelter is a full-service animal hospital whose mission is to provide the highest standard of veterinary care for companion animals.",
        timings:
            "Wednesday-Monday: 10:30AM-1:00PM, 5:30–7:30PM; Tuesday:10:30AM–1:00PM ",
        isFavourite: prefs.getBool('v19-isFavourite') ?? false,
      ),
      VetItem(
        id: "v20",
        name: "Furry Tales Veterinary Clinic",
        lat: 28.5268105480889,
        long: 77.1524938948963,
        address: "Vasant Kunj",
        longAddress:
            "K-95/A-8,9, Kunj Market, Masoodpur, Vasant Kunj, New Delhi, Delhi 110070",
        rating: "4.9 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Ambika'],
        phoneNumber: ['9773844061'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Furry Tales offers medicinal and holistic healing, assisted surgeries, diagnosis and grooming in a cozy environment",
        timings:
            "Wednesday-Monday: 11:00 AM - 1:30 PM, 4:00 PM - 7:00 PM; Tuesday closed",
        isFavourite: prefs.getBool('v20-isFavourite') ?? false,
      ),
      VetItem(
        id: "v21",
        name: "Apollo Vets Healthcare",
        lat: 28.5622925624194,
        long: 77.0628489289313,
        address: "Carmel Chowk, Dwarka",
        longAddress:
            "477, DDA Flats, Pocket-1, Carmel Chowk, Sector-22, Dwarka,",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        doctors: ['Dr Dheeraj Bhardwaj'],
        phoneNumber: ['9990250011'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Specialises in a range of medical, surgical and dental care for pets. They have an experienced team of doctors who are not only qualified but also passionate about their work.",
        timings: "Monday- Sunday: 9:00 AM –8:00 PM",
        isFavourite: prefs.getBool('v21-isFavourite') ?? false,
      ),
      VetItem(
        id: "v22",
        name: "NDMC Veterinary Hospital",
        lat: 28.5824309131369,
        long: 77.1835255539142,
        address: "Opp Rail museum, Moti Bagh",
        longAddress:
            "Shantipath Road, Near Safdarjung Railway Station, Moti Bagh, New Delhi, Delhi 110023",
        rating: "3.9 out of 5",
        ratingSource: "Google",
        doctors: ['Dr Mathur'],
        phoneNumber: ['0112467216'],
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        description: "This is one of Delhi's oldest veterinary hospitals",
        timings: "Monday - Saturday 9:00 AM - 4:00 PM",
        isFavourite: prefs.getBool('v22-isFavourite') ?? false,
      ),
      VetItem(
        id: "v23",
        name: "Doggy World",
        lat: 28.7038441524589,
        long: 77.1253490982733,
        address: "Sector 8, Rohini",
        longAddress:
            "Doggy World, Plot 147, Pocket B 6, Sector 8, Rohini, New Delhi, Delhi 110085",
        rating: "4.2 out of 5",
        ratingSource: "Google",
        doctors: [
          'Dr. S.K. Pandey',
          'Dr. Aradhna Pandey',
          'Dr. Anubhav Singh',
          'Dr. Sarvan Kumar'
        ],
        phoneNumber: ['9811299059'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: "Multi speciality pet hospital",
        timings: "Monday- Sunday: 10:00 AM–2:00 PM, 5:00 - 9:00 Pm",
        isFavourite: prefs.getBool('v23-isFavourite') ?? false,
      ),
      VetItem(
        id: "v24",
        name: "Dr Sood's Dog and Cat Clinic",
        lat: 28.640172432188,
        long: 77.2944358677205,
        address: "Preet Vihar",
        longAddress:
            "B-7/17, Aditya Complex, Preet Vihar, Delhi - 110092, Near Petrol Pump",
        rating: "4.0 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Ajay Sood'],
        phoneNumber: ['9810755225', '01122513941'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Team of experienced and caring professionals - responding fully to your pet's individual needs!",
        timings: "Monday- Sunday: 10:00 AM–3:00 PM",
        isFavourite: prefs.getBool('v24-isFavourite') ?? false,
      ),
      VetItem(
        id: "v25",
        name: "SKRD Veterinary Hospital",
        lat: 28.4528501439252,
        long: 77.0510927525775,
        address: "Sector 31, Gurugram",
        longAddress:
            "Plot No.- 813 Near Om Sweets Market Sector 31 Gurugram, New Delhi, Haryana 122002",
        rating: "4.4 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Sandeep Yadav', 'Dr. Pinki Yadav'],
        phoneNumber: ['9911116896', '7947211773'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v25-isFavourite') ?? false,
      ),
      VetItem(
        id: "v26",
        name: "Dr. Sristi Pet Well Clinic & Hospital",
        lat: 28.4199685594139,
        long: 77.0474622745673,
        address: "Sector 47, Gurugram",
        longAddress:
            "AVA Court, Lower Ground - 06, 07 & 08, Next to Park Hospital, Chestnut St, Malibu Town, Sector 47, Gurugram, Haryana 122018",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        doctors: [
          'Dr. Sristi Balbhadra',
          'Dr. Manu Singh',
          'Dr. Anil Kumar',
          'Dr. Rijvan Khan'
        ],
        phoneNumber: ['9717884108', '8882488116'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "One stop solution, Dr. Sristi Petwell Clinic & Hospital provides all health, wellness and treatment services., including pet grooming and spa, boarding, accessories and products, medicine, treatment and surgery, diagnosis and more.",
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v26-isFavourite') ?? false,
      ),
      VetItem(
        id: "v27",
        name: "Pet Chikitsa Veterinary Hospital",
        lat: 28.4356132567564,
        long: 77.0601353305922,
        address: "Sector 46, Gurugram",
        longAddress:
            "Clinic-3, Behind Huda Shopping Complex, Sector 46, Gurugram, Haryana 122002",
        rating: "4.8 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Parmod', 'Dr. Garima Sharma'],
        phoneNumber: ['9958530395', '9996083663'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v27-isFavourite') ?? false,
      ),
      VetItem(
        id: "v28",
        name: "Cessna Lifeline Veterinary Hospital Gurgaon",
        lat: 28.4335854698412,
        long: 77.047736231408,
        address: "Sector 38, Gurgaon",
        longAddress:
            "265-sp, Sector-38, CH Baktawar Singh Rd, opp. Bharat petroleum Chaudhary, Singh chowk, Gurugram, Haryana 122001",
        rating: "4.7 out of 5",
        ratingSource: "Google",
        doctors: [
          'Dr. Pawan Kumar',
          'Dr. Ramesh Jangra',
          'Dr. Ajitesh Kumar',
          'Dr. Sharanya Surendra'
        ],
        phoneNumber: ['7676365365'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "At Cessna Lifeline, you can get professional treatment of a wide range of diseases and grooming services",
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v28-isFavourite') ?? false,
      ),
      VetItem(
        id: "v29",
        name: "Paws & Claws Pet Clinic",
        lat: 28.4550416909861,
        long: 77.0558099993734,
        address: "Sector 31, Gurugram",
        longAddress:
            "Shop No-14,Mini Huda Market, Shrimati Santhosh Yadav Rd, Sector 31, Gurugram, Haryana 122003",
        rating: "4.0 out of 5.0",
        ratingSource: "Google",
        doctors: ['Dr. Ankur Kumar', 'Dr. Himanshu'],
        phoneNumber: ['9971191027'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: "range of disease",
        timings: "Monday - Sunday 10:00 AM - 9:00 PM",
        isFavourite: prefs.getBool('v29-isFavourite') ?? false,
      ),
      VetItem(
        id: "v30",
        name: "Pet Care & Surgery",
        lat: 28.4628303629044,
        long: 77.0829949640151,
        address: "DLF Phase 4, Gurugram",
        longAddress:
            "5405 Lotus Lane DLF Phase 4 Close to Galleria Market, Gurugram, Haryana 122002",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        doctors: ['Dr Anuj Synghal', 'Dr Anju Synghal', 'Dr Khalid Omer'],
        phoneNumber: ['01244047047'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "The clinic is a full service small animal practice, which has developed over time with support from pet parents and more importantly their pets. ",
        timings:
            "Monday - Saturday: 9:00 AM–12:30 PM, 5:30–6:15 PM; Sunday 9:00 AM- 12:00 PM",
        isFavourite: prefs.getBool('v30-isFavourite') ?? false,
      ),
      VetItem(
        id: "v31",
        name: "Golf Course Vets",
        lat: 28.4429749560904,
        long: 77.1009338952176,
        address: "Sector 53, Gurugram",
        longAddress:
            "G-30 Central Plaza - Pet Clinic, Golf Course Road, near Me, Sector 53, Gurugram, Haryana 122002",
        rating: "4.1 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Kumar'],
        phoneNumber: ['9811076332', '9971089332'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 9:00 AM – 8:00 PM",
        isFavourite: prefs.getBool('v31-isFavourite') ?? false,
      ),
      VetItem(
        id: "v32",
        name: "Josan PetCare Clinics",
        lat: 28.4622761822472,
        long: 77.0876256432402,
        address: "Supermart -1, Gurugram",
        longAddress:
            "A-147, Supermart-1, DLF Phase IV, Sector 27, Gurugram, Haryana 122009",
        rating: "4.3 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Jasjeet Josan', 'Dr. Neelam Josan'],
        phoneNumber: ['01244272684', '01242396169'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Josan Petcare Clinics established in 1994. located in Vasant Kunj, New Delhi and DLF, Gurgaon. Specialises in small animal medicine and takes care of mostly dogs and cats. Also treats rabbits, hamsters, and small birds. ",
        timings:
            "Monday - Saturday: 9:30 AM–1:00 PM, 5:30–8:00 PM; Sunday: 10:00 AM - 1:00 PM",
        isFavourite: prefs.getBool('v32-isFavourite') ?? false,
      ),
      VetItem(
        id: "v33",
        name: "SJ's Pet Care and Clinic",
        lat: 28.4367156866694,
        long: 77.1344534527097,
        address: "Gwal Pahari, Gurugram",
        longAddress:
            "16-Gf, Paras Trade Centre, Gwal Pahari, Gurugram, Haryana 122003",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Shailly'],
        phoneNumber: ['9971004223'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday - Sunday 10:00 AM - 7:00 PM",
        isFavourite: prefs.getBool('v33-isFavourite') ?? false,
      ),
      VetItem(
        id: "v34",
        name: "Niti Bagh Pet Clinic",
        lat: 28.4609323853552,
        long: 77.0793875974129,
        address: "Sushant Lok, Gurugram",
        longAddress:
            "G-15,16&39, Shopping Arcade, Shushant Marg, Sushant Lok Phase I, Gurugram, Haryana 122002",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Rana', 'Dr. Bhavna Kalra', 'Dr. Verma'],
        phoneNumber: ['01244272550', '9711199073'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings:
            "Monday - Saturday: 9:00 AM–2:00 PM, 5:00–8:00 PM; Sunday 10:30 AM - 2:00 PM",
        isFavourite: prefs.getBool('v34-isFavourite') ?? false,
      ),
      VetItem(
        id: "v35",
        name: "Happy Paws Pet Clinic",
        lat: 28.4195356313571,
        long: 77.048928621596,
        address: "Sector 49, Gurugram",
        longAddress:
            "House no. Q1-143, Opp. Park Hospital, Vikas Marg, Sector-49, South City-II, Gurgaon Gurugram, Haryana, India 122101",
        rating: "4.8 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Ketaki Toley'],
        phoneNumber: ['9911379399'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "Compassionate and Comprehensive care for your cuddly companion.",
        timings:
            "Tuesday - Saturday: 11:00 AM - 7:30 PM; Sunday:11:00 AM - 2:00 PM; Monday closed",
        isFavourite: prefs.getBool('v35-isFavourite') ?? false,
      ),
      VetItem(
        id: "v36",
        name: "Pet Works Veterinary Hospital",
        lat: 28.4415745426821,
        long: 77.0825445498504,
        address: "Aardee City, Sector 52, Gurugram",
        longAddress:
            "Ardee City Gate No. 2, 1700- P, Sector- 52, Gurugram, Haryana 122001",
        rating: "4.4 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Vivek', 'Dr. Ashish'],
        phoneNumber: ['9990188900'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings:
            "Monday - Saturday: 10:00 AM - 2:00 PM; 4:00 PM - 8:30 PM; Sunday : 10:00 AM - 8:00 PM",
        isFavourite: prefs.getBool('v36-isFavourite') ?? false,
      ),
      VetItem(
        id: "v37",
        name: "VET 4 PET (Santosh Pet Clinic)",
        lat: 28.4352625590553,
        long: 77.0649987815935,
        address: "Sector 46, Gurugram",
        longAddress:
            "3162, near amity international school, Sector 46, Gurugram, Haryana 122001",
        rating: "4.2 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Dubey'],
        phoneNumber: ['9896606336'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description:
            "The clinic offers a wide range of veterinary services including routine consultations and vaccinations, surgery, radiology, in-house pathology, dentistry, equine and large animal visits in addition to an after-hours service.",
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v37-isFavourite') ?? false,
      ),
      VetItem(
        id: "v38",
        name: "Pet Prime",
        lat: 28.4805433007184,
        long: 77.020442921742,
        address: "Huda Market, Gurugram",
        longAddress:
            "Shop no. 4, Huda Market, Sector 5, Gurugram, Haryana 122001",
        rating: "4.3 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Sapna Soni'],
        phoneNumber: ['9416315202', '8851506788'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings:
            "Monday- Saturday: 10:00 AM - 02:00 PM, 5:00 PM- 8 PM; Sunday: 10:00 AM - 02:00 PM",
        isFavourite: prefs.getBool('v38-isFavourite') ?? false,
      ),
      VetItem(
        id: "v39",
        name: "CP Vet Hospital And Pet Shop Sushant Lok",
        lat: 28.4685489187889,
        long: 77.0746483066262,
        address: "Sushant Lok, Gurugram",
        longAddress:
            "Sushant Lok 1 Rd, Block A, Sushant Lok Phase I, Sector 28, Gurugram, Haryana 122009",
        rating: "4.0 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Ashok'],
        phoneNumber: ['9971157822', '01244272464'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v39-isFavourite') ?? false,
      ),
      VetItem(
        id: "v40",
        name: "Metro Pet Hospital",
        lat: 28.511576665719,
        long: 77.0481751927977,
        address: "Huda, Sector 23, Gurugram",
        longAddress:
            "Shop No. 86 & 88, Commercial Centre, Gate No.2, Huda, Sector 23, Gurugram, Haryana 122017",
        rating: "4.0 out of 5",
        ratingSource: "Google",
        doctors: [
          'Dr. Josan',
          'Dr. Mukesh ',
          'Dr. Lalit',
          'Dr. Shailender Soni'
        ],
        phoneNumber: ['9810291453'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x8",
        isFavourite: prefs.getBool('v40-isFavourite') ?? false,
      ),
      VetItem(
        id: "v41",
        name: "Panacea Veterinary Clinic",
        lat: 28.5870020873938,
        long: 77.3627227434863,
        address: "Sector 53, Noida",
        longAddress:
            "Main Road, opp. Manas Hospital, Block E, Sector 53, Noida, Uttar Pradesh 201301",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Diwakar Mishra'],
        phoneNumber: ['9718211122'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 9:00 AM – 9:00 PM",
        isFavourite: prefs.getBool('v41-isFavourite') ?? false,
      ),
      VetItem(
        id: "v42",
        name: "Vets N Pets Veterinary Clinic",
        lat: 28.5933972237988,
        long: 77.3397937081192,
        address: "Sector 12, Noida",
        longAddress:
            "O-100, Block O, Sector 12, opposite Noida Stadium, Noida, Uttar Pradesh 201301",
        rating: "4.3 out of 5",
        ratingSource: "Google",
        doctors: ['Dr Anoop'],
        phoneNumber: ['0120412 6643'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings:
            "Monday- Saturday: 10AM–1:30PM, 4:30–8:30PM; Sunday:10AM–1:30PM, 4:30–6:00PM",
        isFavourite: prefs.getBool('v42-isFavourite') ?? false,
      ),
      VetItem(
        id: "v43",
        name: "Vets 4 Pets Hospital",
        lat: 28.558673880605,
        long: 77.3725715356458,
        address: "Opp Dominoes, Sector 49, Noida",
        longAddress:
            "East Avenue Grand,LG-1,Chauhan Complex,Dadri Main Rd, Sector 49, Opposite Sec-48 Dominos, Noida, Uttar Pradesh 201303",
        rating: "4.2 out of 5",
        ratingSource: "Google",
        doctors: ['Dr Hansraj'],
        phoneNumber: ['9953039299', '9910986818.0'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday - Sunday: 9:30AM–2:30PM,  5:30–9:30PM",
        isFavourite: prefs.getBool('v43-isFavourite') ?? false,
      ),
      VetItem(
        id: "v44",
        name: "Healwell Pet Clinic",
        lat: 28.562546319274,
        long: 77.366010122014,
        address: "Sector 49, Noida",
        longAddress: "A-31, A block, Sector 49, Noida, Uttar Pradesh 201301",
        rating: "4.4 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Jha'],
        phoneNumber: ['7044612445'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v44-isFavourite') ?? false,
      ),
      VetItem(
        id: "v45",
        name: "Noida 18 Pet Clinic",
        lat: 28.5681735324693,
        long: 77.3362068090843,
        address: "Sector 29, Noida",
        longAddress:
            "Shop no 164, Block 3, Sector 29, Noida, Uttar Pradesh 201301",
        rating: "4.1 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Aditi Tiwari', 'Dr. Singh'],
        phoneNumber: ['9599451040'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: " Sunday - Thursday 10:00 AM - 8:00 PM; Friday closed",
        isFavourite: prefs.getBool('v45-isFavourite') ?? false,
      ),
      VetItem(
        id: "v46",
        name: "CURE & HEAL PET CLINIC",
        lat: 28.5804850010292,
        long: 77.3420523665454,
        address: "Sector 31, Noida",
        longAddress:
            "Plot no - C1, 1, Maharaja Agrasen Marg, opp. to Pillar no 31, Sector 31, Noida, Uttar Pradesh 201301",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Attri', 'Dr. Harkesh'],
        phoneNumber: ['97189 82096'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v46-isFavourite') ?? false,
      ),
      VetItem(
        id: "v47",
        name: "Krishna Lifeline Veterinary Hospital",
        lat: 28.590694104452,
        long: 77.403407924298,
        address: "Sector 122, Noida",
        longAddress:
            "PK A-8, near Baraamda restaurant, Parthala Khanjarpur, Sector 122, Noida, Uttar Pradesh 201304",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Krishna', 'Dr. Jaideep'],
        phoneNumber: ['9404727100'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v47-isFavourite') ?? false,
      ),
      VetItem(
        id: "v48",
        name: "Pet Tales Veterinary Clinic",
        lat: 28.5951180129952,
        long: 77.3757664733419,
        address: "Sector 71, Noida",
        longAddress: "A-77, A Block, Sector 71, Noida, Uttar Pradesh 201301",
        rating: "4.7 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Shivam Patel'],
        phoneNumber: ['8901254697'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v48-isFavourite') ?? false,
      ),
      VetItem(
        id: "v49",
        name: "SKG ANIMAL CLINIC",
        lat: 28.5679655236461,
        long: 77.3949523322359,
        address: "Sector 116, Noida",
        longAddress:
            "BL- 34, near Quick mart grocerry store, Sector 116, Noida, Uttar Pradesh 201306",
        rating: "4.8 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Shrvan Kumar Gupta'],
        phoneNumber: ['8130893931'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday - Sunday 10:00 AM - 8:30 PM",
        isFavourite: prefs.getBool('v49-isFavourite') ?? false,
      ),
      VetItem(
        id: "v50",
        name: "UR PET CLINIC",
        lat: 28.5911241729906,
        long: 77.3358073671347,
        address: "Sector 12, Noida",
        longAddress:
            "C-24, Dallupura Rd, Block C, Sector 12, Noida, Uttar Pradesh 201301",
        rating: "5.0 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Mrigendra Singh'],
        phoneNumber: ['7355033314'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v50-isFavourite') ?? false,
      ),
      VetItem(
        id: "v51",
        name: "Dog and Cat Clinic",
        lat: 28.5211129452766,
        long: 77.3917225604752,
        address: "Sector 92, Noida",
        longAddress:
            "A-81, Main Rd, opp. express view appartment, Block A, Sector 92, Noida, Uttar Pradesh 201304",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Solanki'],
        phoneNumber: ['8384090449'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v51-isFavourite') ?? false,
      ),
      VetItem(
        id: "v52",
        name: "CP Vet Hospital And Pet Shop Noida Branch",
        lat: 28.5742552736752,
        long: 77.3629718877038,
        address: "Sector 50, Noida",
        longAddress:
            "B1/23,Block -B, Central Market, next to the Subway Shop, Sector 50, Noida, Uttar Pradesh 201303",
        rating: "4.2 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Vishal'],
        phoneNumber: ['01244272464', '1246548888.0'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Emergency services open 24x7",
        isFavourite: prefs.getBool('v52-isFavourite') ?? false,
      ),
      VetItem(
        id: "v53",
        name: "SAXENA PET CARE CLINIC",
        lat: 28.6121045060004,
        long: 77.4226962420234,
        address: "Greater Noida",
        longAddress:
            "1ST FLOOR, GALAXY PLAZA, SHOP.NO.9, Greater Noida W Rd, 1, Greater Noida, Uttar Pradesh 201306",
        rating: "4.3 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Anshul Saxena'],
        phoneNumber: ['7359177040'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 10:30 AM–2:30 PM, 6–8:30 PM",
        isFavourite: prefs.getBool('v53-isFavourite') ?? false,
      ),
      VetItem(
        id: "v54",
        name: "Dr. Puri's Pet Clinic",
        lat: 28.6144778049893,
        long: 77.0971801437321,
        address: "Janak Puri",
        longAddress:
            "C6B/9, Behind Desu Colony, Mall Road, Janakpuri, New Delhi, Delhi 110058",
        rating: "4.2 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Puri'],
        phoneNumber: ['9312260168'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 9:30 AM–1:00 PM, 5:30–9:00 PM",
        isFavourite: prefs.getBool('v54-isFavourite') ?? false,
      ),
      VetItem(
        id: "v55",
        name: "VET PRO Kumar's Dog & Cat Clinic",
        lat: 28.6885540889931,
        long: 77.1744978634754,
        address: "Ashok vihar",
        longAddress:
            "WP-1, On Shiv Shanker Chowk Red Light,, Phase 1, Ashok Vihar, Delhi, 110052",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Patel'],
        phoneNumber: ['8130998212'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday - Sunday 10:00 AM - 9:00 PM",
        isFavourite: prefs.getBool('v55-isFavourite') ?? false,
      ),
      VetItem(
        id: "v56",
        name: "Dr Dheeraj Pets Clinic & Surgery Centre",
        lat: 28.6604297732645,
        long: 77.0851464178438,
        address: "Paschim Vihar",
        longAddress:
            "RZ-239,Sayed Nangloi,( meera bagh),Near- Hanuman Mandir, Opp-GH-6, Paschim, Vihar, New Delhi, Delhi 110087",
        rating: "4.9 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. Dheeraj'],
        phoneNumber: ['8130904789'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 10:00 AM–2:00 PM, 5:00–9:30 PM",
        isFavourite: prefs.getBool('v56-isFavourite') ?? false,
      ),
      VetItem(
        id: "v57",
        name: "Vet Plus Dog & Cat Clinic",
        lat: 28.6941612104776,
        long: 77.1897701384224,
        address: "North Delhi",
        longAddress:
            "House No 3, Basement, Gate, Street Number 1, opposite Indian Oil Petrol Pump, State Bank Colony, New Delhi, Delhi 110009",
        rating: "4.4 out of 5",
        ratingSource: "Google",
        doctors: ['Dr. S.K. Singh'],
        phoneNumber: ['8010110007'],
        animalSettings: [
          AnimalSettings.Dogs,
          AnimalSettings.Cats,
          AnimalSettings.Birds
        ],
        description: null,
        timings: "Monday- Sunday: 9:30 AM–2:00 PM, 5:00–9:00 PM",
        isFavourite: prefs.getBool('v57-isFavourite') ?? false,
      ),
      VetItem(
        id: "v58",
        name: "DCC Animal Hospital - Gurgaon",
        description:
            "DCC (Dog Cat Companion) Animal Hospital is India’s first multi-speciality facility offering complete physical and emotional care to pets. It is the first pet healthcare facility in India to offer modern animal medicine and practices in a compassionate and friendly environment.",
        phoneNumber: ['9311560101'],
        timings: "9:30 AM - 7:00 PM Daily",
        doctors: [
          "Dr. Vinod Sharma",
          "Dr. Yasuko Watanabe",
          "Dr. Chetan Sharma",
          "Dr. Chetan Jaroria"
        ],
        lat: 28.50098573568223,
        long: 77.05234614734576,
        rating: "4.7 out of 5.0",
        ratingSource: "Google",
        address: "Jagdamba Farm, Carterpuri Marg, Sector 23A, Gurgaon",
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        isFavourite: prefs.getBool('v58-isFavourite') ?? false,
      ),
      VetItem(
        id: "v59",
        name: "DCC Animal Hospital - New Delhi",
        description:
            "DCC (Dog Cat Companion) Animal Hospital is India’s first multi-speciality facility offering complete physical and emotional care to pets. It is the first pet healthcare facility in India to offer modern animal medicine and practices in a compassionate and friendly environment.",
        phoneNumber: ['9311560101'],
        timings: "10 AM - 7 PM Daily",
        doctors: [
          "Dr. Vinod Sharma",
          "Dr. Yasuko Watanabe",
          "Dr. Chetan Sharma",
          "Dr. Chetan Jaroria"
        ],
        lat: 28.53864650469932,
        long: 77.2401459476511,
        rating: "4.7 out of 5.0",
        ratingSource: "Google",
        address: "E-556, Block E, part-II, Greater Kailash, New Delhi",
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        isFavourite: prefs.getBool('v59-isFavourite') ?? false,
      ),
    ];
  }

  List<VetItem> get items {
    return [..._items];
  }

  List<VetItem> get favourite {
    return _items.where((vetItem) => vetItem.isFavourite).toList();
  }
}
