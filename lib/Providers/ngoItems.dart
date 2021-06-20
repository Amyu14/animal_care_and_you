import 'package:animal_app/Models/ngoItem.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NgoItems with ChangeNotifier {
  List<NgoItem> _items = [];

  Future<void> itemsBuilder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<NgoItem> items = [
      NgoItem(
        id: 'n1',
        name: "Friendicoes, Delhi",
        description:
            "One of the largest and most well-known animal welfare organisations in the city, Frendicoes offers an in-house clinic for strays that accommodates about 150-200 animals at any point in time; two operation theaters; a Lab & X-ray unit as well as a sanctuary in Gurgaon that houses about a thousand animals. There is also a round-the-clock ambulance service for the strays as well as an emergency night clinic for pets.",
        phoneNumber: [
          "01124314787",
          "01124320303",
          "01124320707",
        ],
        emailAddress: ["friendicoes.india@gmail.com"],
        typeOfWork: [
          "Helpline ambulance service from 9AM - 9PM",
          "Neutering program",
          "Adoption program",
          "Equine Clinic",
        ],
        typeOfWorkLinks: [
          "https://friendicoes.org/helpline-ambulance-service/",
          "https://friendicoes.org/spay-neuter-program/",
          "https://friendicoes.org/adoption/",
          "https://friendicoes.org/mobile-equine-clinic/",
        ],
        address: "No 271 & 273, Defence Colony, Flyover Market",
        isFavourite: prefs.getBool('n1-isStarred') ?? false,
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/dog1.jpg",
        ngoType: [NgoType.All],
        donationLink: "https://friendicoes.org/onlinedonation/",
        longAddress:
            "No 271 & 273, Defence Colony, Flyover Market, Jangpura Side, New Delhi",
        rating: "5 out of 5",
        ratingSource: "LBB",
        websiteLink: "https://friendicoes.org/",
      ),
      NgoItem(
        id: 'n2',
        name: "Friendicoes, Gurugram",
        description:
            "One of the largest and most well-known animal welfare organisations in the city, Frendicoes offers an in-house clinic for strays that accommodates about 150-200 animals at any point in time; two operation theaters; a Lab & X-ray unit as well as a sanctuary in Gurgaon that houses about a thousand animals. There is also a round-the-clock ambulance service for the strays as well as an emergency night clinic for pets.",
        phoneNumber: [
          "7027777949",
          "8743019538",
        ],
        emailAddress: ["friendicoes.india@gmail.com"],
        typeOfWork: [
          "Helpline ambulance service from 9AM - 9PM",
          "Neutering program",
          "Adoption program",
          "Equine Clinic",
        ],
        typeOfWorkLinks: [
          "https://friendicoes.org/helpline-ambulance-service/",
          "https://friendicoes.org/spay-neuter-program/",
          "https://friendicoes.org/adoption/",
          "https://friendicoes.org/mobile-equine-clinic/",
        ],
        address: "Village Gopalpur Khera, Garhi Harsaru, Sector 99, Gurugram",
        isFavourite: prefs.getBool('n2-isStarred') ?? false,
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/dog2.jpg",
        ngoType: [NgoType.All],
        donationLink: "https://friendicoes.org/onlinedonation/",
        longAddress:
            "Village Gopalpur Khera, Garhi Harsaru, Sector 99, Gurugram",
        rating: "5 out of 5",
        ratingSource: "LBB",
        websiteLink: "https://friendicoes.org/",
      ),
      NgoItem(
        id: 'n3',
        name: "Red Paws Rescue",
        description:
            "Red Paws Rescue has been taking care of stray animals in New Delhi for the past decade. This organisation lives by the belief that every single effort made by people to help animals takes the cause for the ethical treatment of animals one step further. It recently set up its own recovery centre where injured / unwell animals can be given proper medical treatment and accommodation before they are fit to be sent back to their home areas. \nThe aims and purposes of Red Paws Rescue include finding homes for street dogs and puppies; placing abandoned pets into loving homes;  sterilizing stray animals in different zones across New Delhi; providing high quality medical care; and raising awareness of our cause.",
        phoneNumber: ["9958866067"],
        emailAddress: ["redpawsrescue@gmail.com"],
        typeOfWork: [
          "Helpline ambulance service from 9AM - 9PM",
          "Neutering program",
          "Adoption program",
          "Equine Clinic",
        ],
        typeOfWorkLinks: [
          "https://friendicoes.org/helpline-ambulance-service/",
          "https://friendicoes.org/spay-neuter-program/",
          "https://friendicoes.org/adoption/",
          "https://friendicoes.org/mobile-equine-clinic/",
        ],
        address: "29A, Hauz Khas Village, 1st Floor, New Delhi",
        isFavourite: prefs.getBool('n3-isStarred') ?? false,
        animalSettings: [AnimalSettings.Dogs],
        imageUrl: "assets/image7.jpg",
        ngoType: [NgoType.All],
        donationLink: "https://friendicoes.org/onlinedonation/",
        longAddress: "29A, Hauz Khas Village, 1st Floor, New Delhi",
        rating: "4.7 out of 5",
        ratingSource: "Facebook",
        websiteLink: "https://friendicoes.org/",
      ),
      NgoItem(
        id: "n4",
        name: "Jeevashram",
        emailAddress: ["jeevashram@gmail.com"],
        address:
            "Near Shiv Temple, Golden Gate, Rajokri, New Delhi, Delhi 110038",
        rating: "3.9 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01124124114', '9958924145', '8222065270'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/dog3.jpg",
        ngoType: [NgoType.Shelter, NgoType.Rescue, NgoType.MedicalAid],
        description:
            "Started in 1990, Jeevashram is located at Rajokri Village, New Delhi. Jeevashram focuses on minimizing stress and abuse wherever human and animal interaction is involved. It runs a pet hospital, animal birth control programmes with the MCD, and an animal ambulance service.",
        websiteLink: "www.jeevashram.org",
        isFavourite: prefs.getBool('n4-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n5",
        name: "Dhyan Foundation",
        emailAddress: ["dhyan@dhyanfoundation.com"],
        address: "A-80, South Extension Part II, New Delhi 110049",
        rating: "4.4 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9999099423'],
        animalSettings: [AnimalSettings.Cows],
        imageUrl: "assets/stray5.jpg",
        ngoType: [NgoType.Shelter, NgoType.Rescue, NgoType.MedicalAid],
        description:
            "the Dhyan foundation runs an animal helpline to rescue injured animals, usually cows. They give them medical treatment and rehabilitate them",
        websiteLink: "https://www.dhyanfoundation.com",
        isFavourite: prefs.getBool('n5-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n6",
        name: "Wildlife SOS Delhi",
        emailAddress: ["info@wildlifesos.org"],
        address: "D 210, Defence Colony, New Delhi 110024",
        rating: "3.4 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01146601096', '9871963535'],
        animalSettings: [AnimalSettings.WildAnimals],
        imageUrl: "assets/jackal.jpg",
        ngoType: [NgoType.Rescue, NgoType.MedicalAid],
        description:
            "Mission: (1) conservation and protection of wild populations and habitat (2) rescue of injured and displaced wildlife, and care for captive populations (3) research to better protect and care for wildlife.",
        websiteLink: "https://wildlifesos.org/",
        isFavourite: prefs.getBool('n6-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n7",
        name: "Wildlife SOS Transit Facility, Gurugram",
        emailAddress: ["info@wildlifesos.org"],
        address:
            "Wildlife Rescue Centre & Transit Facility, Vill. Gopalpur, Gurugram, Haryana 122001",
        rating: "3.4 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9871963535'],
        animalSettings: [AnimalSettings.WildAnimals],
        imageUrl: "assets/deer.jpg",
        ngoType: [NgoType.Rescue, NgoType.MedicalAid],
        description:
            "They have a Rapid Response Unit based out of the centre that works round the clock attending to distress calls from members of the public, police, animal lovers and other organizations about wild animals in peril or caught in conflict situations. The rescue centre acts as a transit facility that provides temporary medical care to animals which need time to be able to get released into the wild.",
        websiteLink: "https://wildlifesos.org/",
        isFavourite: prefs.getBool('n7-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n8",
        name: "Tails of Compassion",
        emailAddress: [
          " divya.parthasarathy@yahoo.com",
          "tailsofcompassion@gmail.com"
        ],
        address: "Sector 59, Bandhwari, Haryana 122005",
        rating: null,
        ratingSource: null,
        phoneNumber: ['9650650044'],
        animalSettings: [AnimalSettings.Dogs],
        imageUrl: "assets/stray1.jpg",
        ngoType: [NgoType.Shelter],
        description:
            "Shelter for senior and special needs dogs in Gurgaon, Haryana",
        websiteLink: "http://www.tailsofcompassion.org/",
        isFavourite: prefs.getBool('n8-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n9",
        name: "Sanjay Gandhi Animal Centre",
        emailAddress: ["sgacc1980@gmail.com"],
        address:
            "Shivaji College Rd, Shivaji Enclave, Raja Garden, New Delhi, Delhi 110027",
        rating: "3.6 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01125447751', '01125448062'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/stray3.jpg",
        ngoType: [NgoType.Shelter, NgoType.Rescue, NgoType.MedicalAid],
        description:
            "India's oldest and Asia’s largest all-animal shelter, is open 24/7 and runs a round-the-clock free animal ambulance service and helpline. Its busy OPD treats over 200 animals a day providing medical, diagnostic, surgical, and dental services.",
        websiteLink: "http://www.sanjaygandhianimalcarecentre.org",
        isFavourite: prefs.getBool('n9-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n10",
        name: "People for Animals, Delhi",
        emailAddress: ["gandhim@nic.in"],
        address: "4-T, DCM Building, 16 Barakhamba Road, New Delhi 110001",
        rating: "2.7 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01123357088', '01123719293', '01123719294'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/stray2.jpg",
        ngoType: [NgoType.Rescue, NgoType.Campaigning],
        description:
            "People for Animals, also known as PFA, is India's largest animal welfare organization with a nationwide network of 26 hospitals, 165 units, 60 mobile units, and 2.5 Lakh members.",
        websiteLink: "https://www.peopleforanimalsindia.org/",
        isFavourite: prefs.getBool('n10-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n11",
        name: "All Creatures Great and Small",
        emailAddress: ["gopalan.anjali@gmail.com"],
        address:
            "Village Silakhari, P.O. Dhauj, Tehsil & District Faridadad, Haryana 121004, ",
        rating: "4.7 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9910308374'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/bird2.jpg",
        ngoType: [NgoType.Shelter, NgoType.MedicalAid],
        description:
            "ACGS’s mission is to create a gentle, nurturing, loving and compassionate sanctuary for old, sick, abandoned and lonely animals.",
        websiteLink: "https://allcreaturesgreatandsmall.in/",
        isFavourite: prefs.getBool('n11-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n12",
        name: "Happy Paws Medicare Boarding",
        emailAddress: ["happypaws17@gmail.com"],
        address:
            "Happy paws Medicare boarding center, New gwal pahadi oppt. ASF insignia building, Gurugram Haryana",
        rating: "3.5 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9899172447'],
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        imageUrl: "assets/dog2.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Shelter],
        description:
            "Offers boarding facililities to sick dogs along with complete medical support including vet visits, medication and nurturing of the sick animal",
        websiteLink: null,
        isFavourite: prefs.getBool('n12-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n13",
        name: "Kalyani welfare Foundation, Chattarpur",
        emailAddress: ["kalyaniawf@gmail.com"],
        address:
            "Khasra No. 849 & 850, Village: Bhati, Near Radha Swami Satsang Gate, 2C, Main Rd, Chhatarpur, New Delhi, Delhi 110074",
        rating: "4.5 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9818911612'],
        animalSettings: [AnimalSettings.Dogs, AnimalSettings.Cats],
        imageUrl: "assets/dog3.jpg",
        ngoType: [NgoType.Shelter],
        description: "Shelter for dogs and cats",
        websiteLink: "https://m.facebook.com/kalyaniawf/",
        isFavourite: prefs.getBool('n13-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n14",
        name: "Posh Foundation, Noida",
        emailAddress: ["icare@poshfoundation.in"],
        address:
            "Posh Foundation ,near, Asagarpur Jagir, Bandh Rd, Noida, Uttar Pradesh 201304",
        rating: "3.9 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9953440509', '9716558043'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/dog1.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Rescue],
        description:
            "An organisation focused on rescue and treatment of injured or sick animals",
        websiteLink: "https://www.poshfoundation.in/",
        isFavourite: prefs.getBool('n14-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n15",
        name: "Charity Birds Hospital, Chandni Chowk",
        emailAddress: ["charitybirdshospital@gmail.com"],
        address:
            "Next to Shri Digambar Jain Lal Mandir (, opposite to Red Fort, Chandni Chowk, Delhi, 110006",
        rating: "4.3 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01147243215'],
        animalSettings: [AnimalSettings.Birds],
        imageUrl: "assets/bird1.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Shelter],
        description: "A bird hospital that treats all types of birds",
        websiteLink: "http://charitybirdshospital.org/",
        isFavourite: prefs.getBool('n15-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n16",
        name: "Pet Animal Welfare Society (PAWS)",
        emailAddress: ["paws@pawsindia.org"],
        address:
            "C9/7, Masoodpur, Badam Singh Market, Vasant Kunj, New Delhi, Delhi",
        rating: "3.4 out of 5",
        ratingSource: "Google",
        phoneNumber: ['01126895737'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/stray1.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Campaigning],
        description: "Treatment of injured/ sick animals",
        websiteLink: "https://www.pawsindia.org/",
        isFavourite: prefs.getBool('n16-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n17",
        name: "Umeed for Animals Foundation, Gurugram, Haryana",
        emailAddress: ["umeedadoptions@gmail.com"],
        address:
            "Lumberdar Farm, Baliawas Village, Near Pathways School, Gurgaon-Faridabad Road, Gurugram, Haryana",
        rating: "3.8 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9999956541'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/lyingDog.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Shelter],
        description:
            "UMEED is a Rehabilitation Centre dedicated to helping animals in distress.",
        websiteLink: "https://www.facebook.com/umeedforanimals",
        isFavourite: prefs.getBool('n17-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n18",
        name: "House of Stray Animals, Noida",
        emailAddress: ["strayanimals12@gmail.com"],
        address:
            "Main Rd Gijhor, near Police Chowki, near somer ville school sec 22, Sector 54, Noida, Uttar Pradesh 201301",
        rating: "4.0 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9818048398'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/stray2.jpg",
        ngoType: [NgoType.MedicalAid, NgoType.Rescue],
        description:
            "Free medical care to stray animals through a 24x7 animal dispensary",
        websiteLink: "https://www.facebook.com/hsanoida",
        isFavourite: prefs.getBool('n18-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n19",
        name: "Indigree Angels Trust",
        emailAddress: ["indigreeangels@gmail.com"],
        address: "B-5/197, Safdarjang Enclave",
        rating: null,
        ratingSource: null,
        phoneNumber: ['9810565731', '9958377803', '9873822268'],
        animalSettings: [AnimalSettings.Dogs],
        imageUrl: "assets/image7.jpg",
        ngoType: [NgoType.MedicalAid],
        description: "Mobile clinic for minor wounds and treatment of animals",
        websiteLink: "https://www.facebook.com/indigreeangelstrust/",
        isFavourite: prefs.getBool('n19-isFavourite') ?? false,
      ),
      NgoItem(
        id: "n20",
        name: "Karma Animal Foundation",
        emailAddress: ["karmaanimalfoundation@gmail.com"],
        address:
            "Surya Farms, Next to Country inn by Carlson, Bhondsi, Gurgaon – Sohna Road, Gurugram – 122001",
        rating: "4.6 out of 5",
        ratingSource: "Google",
        phoneNumber: ['9811028965'],
        animalSettings: [AnimalSettings.All],
        imageUrl: "assets/newDog.jpg",
        ngoType: [NgoType.Shelter],
        description:
            "Looks after homeless, abandoned, injured and disabled animals.",
        websiteLink: "https://www.facebook.com/karmaanimalfoundation/",
        isFavourite: prefs.getBool('n20-isFavourite') ?? false,
      ),
    ];

    _items = items;
  }

  List<NgoItem> get items {
    return [..._items];
  }

  List<NgoItem> get favouriteItems {
    return _items.where((ngoItem) => ngoItem.isFavourite == true).toList();
  }
}
