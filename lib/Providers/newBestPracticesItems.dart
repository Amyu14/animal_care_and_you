import 'package:animal_app/Models/bestPracticesItem.dart';
import 'package:animal_app/Screens/ambulancesScreen.dart';
import 'package:animal_app/Screens/ngoScreen.dart';
import 'package:animal_app/Screens/vetsScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewBestPracticesItems with ChangeNotifier {
  List<BestPracticesItem> _items = [];

  Future<void> itemBuilder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<BestPracticesItem> items = [
      BestPracticesItem(
        id: "bp1",
        category: Categories.DiseaseResponse,
        isDisease: true,
        diseaseOrSituation:
            "Parvovirus - is a highly contagious disease that mainly impacts dogs. In many cases, it can be fatal. ",
        symptoms:
            "Parvovirus usually affects puppies. An infected dog may exhibit lethargic behaviour and a loss of appetite as initial signs. It might also have a fever. As the virus progress, the dog is likely to suffer from severe vomitting, diarrhea and bloody stool.  In extreme cases, puppies may collapse and have a highly elevated heart rate.",
        description:
            "The treatment for parvovirus mainly involves veterinary hospitalisation, where the infected dog is supported so that its immune system can fight off the disease. \nSupportive treatment for parvovirus includes hospitalistion with intravenous fluids; focusing on nutrition, with a feeding tube, if required; and antiemetics to reduce vomitting. ",
        relevantLinks: [
          'https://www.petmd.com/dog/conditions/infectious-parasitic/c_dg_canine_parvovirus_infection#parvo-symptoms'
        ],
        linksInApp: [false],
        domainNames: ['petmd.com'],
        areLinksCustom: [false],
        imageUrl: "assets/image1.jpg",
        isStarred: prefs.getBool('bp1-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp2",
        category: Categories.DiseaseResponse,
        isDisease: true,
        diseaseOrSituation:
            "Rabies - is a disease which causes inflammation in the brain and is usually fatal.",
        symptoms:
            "The symptoms of rabies include fearfullness, aggression, paralysis, and seizures.",
        description:
            "Although there is no cure for rabies, it can be prevented by visiting a veterinarian on a regular basis and keeping rabies vaccinations up-to-date for all cats, ferrets, and dogs.",
        relevantLinks: [
          'https://www.petmd.com/dog/care/5-rabies-prevention-tips-dogs'
        ],
        linksInApp: [false],
        domainNames: ['petmd.com'],
        areLinksCustom: [false],
        // imageUrl: "image2",
        isStarred: prefs.getBool('bp2-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp3",
        isDisease: true,
        category: Categories.DiseaseResponse,
        diseaseOrSituation:
            "Mange - is a skin condition of animals caused by mite infestations. ",
        symptoms:
            "The main characteristics of mange are inflammation, itching, thickening of the skin, and hair loss.",
        description:
            "Most forms of mange can be treated. Possible means of healing an animal's skin and controlling the mite population include spot-on treatments, anti-parasitic medicines and antibiotics. Generally, it is advised to consult a practiced veterinarian and get a prescription.",
        relevantLinks: [
          'https://www.akc.org/expert-advice/health/mange-what-you-need-to-know/'
        ],
        linksInApp: [false],
        domainNames: ['akc.org'],
        areLinksCustom: [false],
        imageUrl: "assets/image3.jpg",
        customHight: 240,
        isStarred: prefs.getBool('bp3-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp4",
        isDisease: false,
        category: Categories.LifestyleChoices,
        diseaseOrSituation: null,
        symptoms: null,
        description:
            "Most consumer products are inhumanely tested on animals that are deliberately poisoned or blinded. Check a product's packaging to ensure that it is produced in a cruelty-free manner; if not, try looking for alternatives.",
        relevantLinks: [
          'https://www.crueltyfreekitty.com/list-of-cruelty-free-brands/',
          'https://www.crueltyfreekitty.com/companies-that-test-on-animals/'
        ],
        linksInApp: [false, false],
        domainNames: [
          'List of cruelty-free brands',
          'Companies that test on animals'
        ],
        areLinksCustom: [true, true],
        imageUrl: "assets/image4.jpg",
        isStarred: prefs.getBool('bp4-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp5",
        isDisease: false,
        category: Categories.ReportingCruelty,
        diseaseOrSituation: "You encounter an instance of animal abuse",
        symptoms: null,
        description:
            "DOCUMENT THE CRIME - if it is possible, take a picture or video of the occurrence. Take note of relevant details, such as license plate numbers and a visual of the abuser. Try collecting witnesses and getting statements from experts (e.g., veterinarians) about the animal's physical condition. \n \n REPORT THE CRIME - file a first information report (FIR) with the police. An FIR initiates the process of criminal justice - police will investigate a case only after an FIR has been filed. Alternatively, you can file a private complaint with the court.",
        relevantLinks: [
          'https://www.humanrightsinitiative.org/publications/police/fir.pdf'
        ],
        linksInApp: [false],
        domainNames: ['How to file an FIR'],
        areLinksCustom: [true],
        // imageUrl: "image5",
        isStarred: prefs.getBool('bp5-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp6",
        isDisease: false,
        category: Categories.ReportingCruelty,
        diseaseOrSituation: null,
        symptoms: null,
        description:
            "Familiarise yourself with animal protection laws by visiting the link provided below.",
        relevantLinks: ['http://www.awbi.in/'],
        linksInApp: [false],
        domainNames: ['Animal Welfare Board of India'],
        areLinksCustom: [true],
        imageUrl: "assets/image6.jpg",
        isStarred: prefs.getBool('bp6-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp7",
        isDisease: false,
        category: Categories.LifestyleChoices,
        diseaseOrSituation: null,
        symptoms: null,
        description:
            "Rather than buying a pet from a store or a breeder, consider adopting one from an animal shelter or an adoption centre. Providing a stray puppy with a home is also an excellent choice - find out how to do this viably by visiting the link below.",
        relevantLinks: [
          'https://www.wagr.in/blog/breeds/how-to-adopt-a-stray-dog-india-guide/'
        ],
        linksInApp: [false],
        domainNames: ['Adopting  a stray dog'],
        areLinksCustom: [true],
        imageUrl: "assets/image7.jpg",
        isStarred: prefs.getBool('bp7-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp8",
        isDisease: false,
        category: Categories.HelpingDistressedAnimal,
        diseaseOrSituation: "You come across an injured / abused animal",
        symptoms: null,
        description:
            "Do not assume that someone else will help. An animal in distress may require immediate veterinary care, without which, it may suffer for a long time or die due to its injuries. If you must leave the animal momentarily, request someone you trust to be present next to the animal and return as soon as possible with help. If you are unclear about what to do in the situation, you can contact veterinarians, animal ambulances, and/or animal NGOs through this app.",
        relevantLinks: [
          NgoScreen.routeName,
          AmbulanceScreen.routeName,
          NgoScreen.routeName,
        ],
        linksInApp: [true, true, true],
        domainNames: [
          'Animal NGOs',
          'Animal Ambulance Services',
          'Animal NGOs'
        ],
        areLinksCustom: [true, true, true],
        // imageUrl: "image8",
        isStarred: prefs.getBool('bp8-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp9",
        isDisease: false,
        category: Categories.HelpingDistressedAnimal,
        diseaseOrSituation: null,
        symptoms: null,
        description:
            "The monsoon season can be extremely tough for stray animals. In addition to the cold, these animals are susceptible to water borne diseases. Open wounds are aggravated on exposure to water, often resulting in maggots. \nApplying anti-tick powder and providing dry spots for cats and dogs to sit help mitigate such possibilities. Temporary shelters can be constructed simply and affordably using plastic items, rubber tires, and cardboard boxes.",
        relevantLinks: [
          'https://www.scoopwhoop.com/animals/simple-ways-to-help-stray-animals-during-monsoon-season/'
        ],
        linksInApp: [false],
        domainNames: ['scoopwhoop.com'],
        areLinksCustom: [false],
        imageUrl: "assets/image9.jpg",
        isStarred: prefs.getBool('bp9-isFavourite') ?? false,
      ),
      BestPracticesItem(
        id: "bp10",
        isDisease: true,
        category: Categories.DiseaseResponse,
        diseaseOrSituation: "Maggots in dogs",
        symptoms:
            "Animals with open flesh wounds are often prone to maggot infestations in humid season.",
        description:
            "Maggots need to be removed by an experienced veterinarian. However, to temporarily address the problem till the animal can see a vet, one can use D-mag spray or Negasunt powder.",
        isStarred: prefs.getBool('bp10-isFavourite') ?? false,
      ),
    ];

    _items = items;
  }

  List<BestPracticesItem> get items {
    return [..._items];
  }

  List<BestPracticesItem> get favouriteItems {
    return _items.where((bpItem) => bpItem.isStarred).toList();
  }
}
