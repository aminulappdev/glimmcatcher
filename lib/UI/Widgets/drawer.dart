import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/info_screen.dart';
import 'package:glimmcatcher/UI/Screen/Home/profile_update_screen.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/payment_field_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            drawerHeader(context),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  costomRow(
                      context, Icons.edit, 'Edit Profile', Icons.chevron_right,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileUpdateScreen()),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  costomRow(context, Icons.lock_outline, 'Changed password',
                      Icons.chevron_right, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentFieldScreen()),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  costomRow(
                      context, Icons.info_outline, 'About', Icons.chevron_right,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoScreen(
                          appBarTitle: 'About us',
                          data:
                              '''1. IntroductionWelcome to Fetal Med&C app. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, share, and protect your information when you use our app, which connects patients with doctors for monitoring weight, blood pressure, and glucose levels and includes a chat feature for exchanging personal data.2. Information We Collecta. Personal Information:Contact Information: Name, email address, phone number, and address.Health Information: Weight, blood pressure, glucose levels, medical history, current medications, allergies, and other health-related data you provide.Account Information: Username, password, and other registration details.b. Usage Information:Data on how you use the app, including logs of your interactions with doctors, chat messages, and health data entries.c. Device Information:Information about the device you use to access the app, such as the device type, operating system, and IP address.3. How We Use Your InformationWe use your information for the following purposes:To Provide Services: Facilitate communication between you and your doctor, monitor health metrics, and provide personalized care.To Improve the App: Analyze usage patterns to enhance the app’s functionality and user experience.To Communicate with You: Send you notifications, updates, and respond to your inquiries.To Ensure Security: Monitor for suspicious activity to protect against fraud and unauthorized access.4. Sharing Your InformationWe may share your information with:Healthcare Providers: Your doctors and authorized medical personnel to provide you with care.Service Providers: Third-party companies that assist in operating our app (e.g., cloud storage, data analytics) under strict confidentiality agreements.Legal Compliance: Authorities or other entities when required by law or necessary to protect our rights, safety, or property.5. Data SecurityWe implement industry-standard security measures to protect your data, including encryption, secure servers, and access controls. However, no system is completely secure, and we cannot guarantee absolute security.6. Data RetentionWe retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law. After this period, your data will be securely deleted or anonymized.7. Your RightsYou have the following rights regarding your personal data:Access: Request a copy of the personal information we hold about you.Correction: Request correction of inaccurate or incomplete data.Deletion: Request deletion of your data under certain conditions.Withdrawal of Consent: Withdraw your consent for data processing where applicable.To exercise these rights, please contact us at contacto@fetalmedyc.com.8. Third-Party LinksOur app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these external sites. We recommend reviewing the privacy policies of any third-party sites you visit.9. Children's PrivacyOur app is not intended for use by children under the age of 18. We do not knowingly collect personal information from children without parental consent. If we become aware of such data, we will delete it promptly.10. Changes to This Privacy PolicyWe may update this Privacy Policy periodically to reflect changes in our practices or legal requirements. We will notify you of any significant changes via the app or email.11. Contact UsIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:Fetal Med&CViad. Río Becerra 97, Nápoles, Benito Juárez, 03810 Ciudad de México, CDMX contacto@fetalmedyc.com+52 55 2523 6401''',
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  costomRow(context, Icons.gavel, 'Privacy Policy',
                      Icons.chevron_right, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoScreen(
                          appBarTitle: 'Privacy Policy',
                          data:
                              '''1. IntroductionWelcome to Fetal Med&C app. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, share, and protect your information when you use our app, which connects patients with doctors for monitoring weight, blood pressure, and glucose levels and includes a chat feature for exchanging personal data.2. Information We Collecta. Personal Information:Contact Information: Name, email address, phone number, and address.Health Information: Weight, blood pressure, glucose levels, medical history, current medications, allergies, and other health-related data you provide.Account Information: Username, password, and other registration details.b. Usage Information:Data on how you use the app, including logs of your interactions with doctors, chat messages, and health data entries.c. Device Information:Information about the device you use to access the app, such as the device type, operating system, and IP address.3. How We Use Your InformationWe use your information for the following purposes:To Provide Services: Facilitate communication between you and your doctor, monitor health metrics, and provide personalized care.To Improve the App: Analyze usage patterns to enhance the app’s functionality and user experience.To Communicate with You: Send you notifications, updates, and respond to your inquiries.To Ensure Security: Monitor for suspicious activity to protect against fraud and unauthorized access.4. Sharing Your InformationWe may share your information with:Healthcare Providers: Your doctors and authorized medical personnel to provide you with care.Service Providers: Third-party companies that assist in operating our app (e.g., cloud storage, data analytics) under strict confidentiality agreements.Legal Compliance: Authorities or other entities when required by law or necessary to protect our rights, safety, or property.5. Data SecurityWe implement industry-standard security measures to protect your data, including encryption, secure servers, and access controls. However, no system is completely secure, and we cannot guarantee absolute security.6. Data RetentionWe retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law. After this period, your data will be securely deleted or anonymized.7. Your RightsYou have the following rights regarding your personal data:Access: Request a copy of the personal information we hold about you.Correction: Request correction of inaccurate or incomplete data.Deletion: Request deletion of your data under certain conditions.Withdrawal of Consent: Withdraw your consent for data processing where applicable.To exercise these rights, please contact us at contacto@fetalmedyc.com.8. Third-Party LinksOur app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these external sites. We recommend reviewing the privacy policies of any third-party sites you visit.9. Children's PrivacyOur app is not intended for use by children under the age of 18. We do not knowingly collect personal information from children without parental consent. If we become aware of such data, we will delete it promptly.10. Changes to This Privacy PolicyWe may update this Privacy Policy periodically to reflect changes in our practices or legal requirements. We will notify you of any significant changes via the app or email.11. Contact UsIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:Fetal Med&CViad. Río Becerra 97, Nápoles, Benito Juárez, 03810 Ciudad de México, CDMX contacto@fetalmedyc.com+52 55 2523 6401''',
                        ),),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  costomRow(context, Icons.description, 'Terms of Services',
                      Icons.chevron_right, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoScreen(
                          appBarTitle: 'Terms of Services',
                          data:
                              '''1. IntroductionWelcome to Fetal Med&C app. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, share, and protect your information when you use our app, which connects patients with doctors for monitoring weight, blood pressure, and glucose levels and includes a chat feature for exchanging personal data.2. Information We Collecta. Personal Information:Contact Information: Name, email address, phone number, and address.Health Information: Weight, blood pressure, glucose levels, medical history, current medications, allergies, and other health-related data you provide.Account Information: Username, password, and other registration details.b. Usage Information:Data on how you use the app, including logs of your interactions with doctors, chat messages, and health data entries.c. Device Information:Information about the device you use to access the app, such as the device type, operating system, and IP address.3. How We Use Your InformationWe use your information for the following purposes:To Provide Services: Facilitate communication between you and your doctor, monitor health metrics, and provide personalized care.To Improve the App: Analyze usage patterns to enhance the app’s functionality and user experience.To Communicate with You: Send you notifications, updates, and respond to your inquiries.To Ensure Security: Monitor for suspicious activity to protect against fraud and unauthorized access.4. Sharing Your InformationWe may share your information with:Healthcare Providers: Your doctors and authorized medical personnel to provide you with care.Service Providers: Third-party companies that assist in operating our app (e.g., cloud storage, data analytics) under strict confidentiality agreements.Legal Compliance: Authorities or other entities when required by law or necessary to protect our rights, safety, or property.5. Data SecurityWe implement industry-standard security measures to protect your data, including encryption, secure servers, and access controls. However, no system is completely secure, and we cannot guarantee absolute security.6. Data RetentionWe retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law. After this period, your data will be securely deleted or anonymized.7. Your RightsYou have the following rights regarding your personal data:Access: Request a copy of the personal information we hold about you.Correction: Request correction of inaccurate or incomplete data.Deletion: Request deletion of your data under certain conditions.Withdrawal of Consent: Withdraw your consent for data processing where applicable.To exercise these rights, please contact us at contacto@fetalmedyc.com.8. Third-Party LinksOur app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these external sites. We recommend reviewing the privacy policies of any third-party sites you visit.9. Children's PrivacyOur app is not intended for use by children under the age of 18. We do not knowingly collect personal information from children without parental consent. If we become aware of such data, we will delete it promptly.10. Changes to This Privacy PolicyWe may update this Privacy Policy periodically to reflect changes in our practices or legal requirements. We will notify you of any significant changes via the app or email.11. Contact UsIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:Fetal Med&CViad. Río Becerra 97, Nápoles, Benito Juárez, 03810 Ciudad de México, CDMX contacto@fetalmedyc.com+52 55 2523 6401''',
                        ),),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              size: 18,
                              Icons.logout_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sign out',
                            style: GoogleFonts.urbanist(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentFieldScreen(),
                                ));
                          },
                          child: Icon(Icons.chevron_right))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DrawerHeader drawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffDB92FE),
              Color(0xffFBC774),
            ]),
      ),
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetPath.aiGenerate),
              radius: 30,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Ostad Nazmul Huda',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            'ostadnazmulboss@gmail.com',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      )),
    );
  }

  Row costomRow(BuildContext context, IconData circleIcon, String name,
      IconData icon, VoidCallback navigator) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: navigator,
          child: Row(
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffDB92FE),
                      Color(0xffFBC774),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  size: 18,
                  circleIcon,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: GoogleFonts.urbanist(
                    fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Icon(icon)
      ],
    );
  }
}
