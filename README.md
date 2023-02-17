<h1>Do dietary preferences effect price?</h1>

<h2>The problem</h2>

More and more people are choosing to change or remove certain foods from their daily dietary habits due to allergies, intolerance, or personal preferences, and it is changing the market (Brouwer, 2021).

To understand the problem first we need to explain what is dietary preference and how it defines food price. Dietary preference is a series of attributes in food (such as organic, vegan…), and some costumer has food rules or preferences to make a purchase decision (Golestanbagh, 2021). The cost of production of some categories such as organic is higher compared to the actual process due to additional steps in growing food (Acciani, 2020).

Focus on a hypothetical sample from Whole Foods Market, we need to analyze if the dietary preferences affect the price of a product and bring 3 insights.

<h2>Do dietary preferences effect price?</h2>

Yes, dietary preferences do effect price. Using a sample of 214 products I created a SQL query using the t-test formula (Appendix 1). The logic has based the sum of all diet preferences and compared it with the price using a t-test. The value (-13.70) resulted from the t-test is less than alpha (0.05), we reject the H0 and conclude H1(Appendix 2), this means there is a statistically significant difference between dietary preference and price.

In addition, to confirm the hypothesis, using regression on excel (Appendix 3), the overall dietary preferences do effect the price because the significance F is less than alpha.

From the research, the cost for produce food with dietary preferences element costs more. Using the data I have analyzed, we can confirm the hypothesis. Whole Foods should bring more value attributes (not price) to make more sense for the customer buy it.

<h2>Top three actionable insights </h2>

<strong>#1 Increase the customer awareness</strong>

The element of knowledge is essential for customer acquisition. “People are more likely to consume a product if they’re aware of its cost.”  (Malmendier, 2014). Stand-out the attributes such as organic certification or local origin declaration can increase customer trust and decision. It will bring value to the product and justifying the price.

The action is to provide QR code on products in the physical store and links on the online store for checking all the dietary preferences specs about product certifications and declarations of origin.

<strong>#2 Provide value through teaching the customer</strong>

Reducing of intake of sugar, artificial sweeteners, and sweetened beverages can lead to a healthy life with less chance of disease (Dicker, 2020). Since I started this research I didn’t know so well about food preferences and their benefits for having a healthy life. Using the right dietary preferences and products in everyday eating habits can increase your life quality. But what’s good for me?

Whole Foods Market should provide free online content about dietary preferences, and how to use their products in a more effective way to archive more results on their customers. In addition, they can provide additional nutritionist services to recommend the best products to the person.

<strong>#3 Organize the data</strong>

The data provided was disorganized and with issues that could lead to miss information and lack of accuracy. Good coordination with the software development and different areas can set up proper documentation for how the data should be entered into the system. “Human error influences over 60% of dirty data, and poor interdepartmental communication is involved in about 35% of inaccurate data records.” (Dekker, 2017).

Steps to fix it are to organize the documentation, check where the data is been input incorrectly, and fix it and normalize the fields, such as price don’t allow zero or too high. Also, divide in separate tables and use the correct relationships. Applying this steps will increace the data performance and analyses.

<strong>Appendix 1 </strong>

<img width="261" alt="Screen Shot 2023-02-17 at 2 37 27 PM" src="https://user-images.githubusercontent.com/12221050/219810374-4f9cb8df-b584-4b6f-a045-584b3067d1df.png">

Formula “t -test = (sample mean 1 – sample mean 2)/[ sqrt ( s1^2/n1 + s2^2/n2) ]”


<strong>Appendix 2 </strong>

<img width="411" alt="Screen Shot 2023-02-17 at 2 37 32 PM" src="https://user-images.githubusercontent.com/12221050/219810438-139b1895-956d-4f16-beff-0445e1e5d5b0.png">

Result of the t-test using SQL


<strong>Appendix 3 </strong>

<img width="513" alt="Screen Shot 2023-02-17 at 2 37 39 PM" src="https://user-images.githubusercontent.com/12221050/219810538-cd4547e6-f868-4261-86b8-2066b2f10c68.png">

Regression on excel

<strong>References</strong>

Acciani, C. (2020, December 8). Pulses for Healthy and Sustainable Food Systems: The Effect of Origin on Market Price. MDPI. https://www.mdpi.com/2071-1050/13/1/185 

Brouwer, I. D. (2021, October 16). Reverse thinking: taking a healthy diet perspective towards food systems transformations. SpringerLink. https://link.springer.com/article/10.1007/s12571-021-01204-5

Dekker, S. (2017, November 1). The Field Guide to Understanding “Human Error” | Sidney Dekker | Taylo. Taylor & Francis. https://www.taylorfrancis.com/books/mono/10.1201/9781317031833/field-guide-understanding-human-error-sidney-dekker 

Dicker, D. (2020). Weight Loss, Dietary Preferences, and Reduction in the Sense of Smell with the Use of a Novel Nasal Device. FullText - Obesity Facts 2020, Vol. 13, No. 5 - Karger Publishers. https://www.karger.com/Article/FullText/508976 

Golestanbagh, N. (2021, January 1). Association of personality traits with dietary habits and food/taste preferences Golestanbagh N, Miraghajani M, Amani R, Symonds ME, Neamatpour S, Haghighizadeh MH - Int J Prev Med. https://www.ijpvmjournal.net/article.asp?issn=2008-7802;year=2021;volume=12;issue=1;spage=92;epage=92;aulast=Golestanbagh 

Malmendier, Pricing and the Psychology of Consumption. (2014, August 1). Harvard Business Review. https://hbr.org/2002/09/pricing-and-the-psychology-of-consumption 
