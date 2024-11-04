import { useEffect, useState } from 'react';
import backgroundEllipse from '/radialEllipseBackground.png'
import stars from '/starsReview.png'
import AOS from 'aos';
import 'aos/dist/aos.css';

const sentences = [
    "SPEND MONEY SMARTER WITH FLUXO!",
    "TRACK YOUR SPENDING WITH FLUXO!",
    "PLAN YOUR BUDGET WITH FLUXO!",
    "SAVE MORE, WORRY LESS WITH FLUXO!"
];

export const Heading = () => {
    const [currentSentence, setCurrentSentence] = useState(sentences[0]);
    const [index, setIndex] = useState(0);
    const [visible, setVisible] = useState(true);

    useEffect(() => {
        const interval = setInterval(() => {
            setVisible(false); // Fade out
            setTimeout(() => {
                setIndex((prevIndex) => (prevIndex + 1) % sentences.length);
                setVisible(true); // Fade in
            }, 500);
        }, 3000);

        return () => clearInterval(interval);
    }, []);

    useEffect(() => {
        setCurrentSentence(sentences[index]);
    }, [index]);

    useEffect(() => {
        AOS.init({
            duration: 1000, 
            easing: 'ease-in-out',
            once: false, 
        });
    }, []);
    

    return (
        <>
            <img
                src={backgroundEllipse}
                alt="Background gradient"
                className="-top-52 w-[40rem] -z-50 -left-24 absolute select-none"
            />

            <img
                src={backgroundEllipse}
                alt="Background gradient"
                className="w-[40rem] -z-50 right-0 absolute select-none"
            />
            <div className="text-left" data-aos="fade-down-right"> 
                <h2 className={`text-[25px] text-gray-400 transition-opacity duration-500 ${visible ? 'opacity-100' : 'opacity-0'}`}>
                    {currentSentence}
                </h2>
                <h1 className="text-[55px] font-bold -mt-2 leading-tight bg-gradient-to-r from-[#FFFFFF] to-[#ecf0f359] bg-clip-text text-transparent">
                    <span className="z-10">BEST</span> <span className="text-[#57ff5a]">FINANCIAL</span><br />
                    <span className="text-[#57ff5a]">MANAGEMENT SYSTEM</span><br />
                    <span className="">FOR YOUR FAMILY.</span>
                </h1>
                
                <div className="flex flex-col items-center mt-8">
                    <div className="w-full h-0.5 bg-gray-100 mb-4"></div>
                    <div className="flex justify-between w-full max-w-[800px] gap-4">
                        <img 
                            src="chartpic.png" 
                            alt="Image 1" 
                            className="w-[106px] h-[106px] rounded-full object-cover" 
                        />
                        <img 
                            src="clockpic.png" 
                            alt="Image 2" 
                            className="w-[106px] h-[106px] rounded-full object-cover"  
                        />
                        <img 
                            src="moneypic.png" 
                            alt="Image 3" 
                            className="w-[106px] h-[106px] rounded-full object-cover"
                        />
                    </div>
                    <div className="w-full h-0.5 bg-gray-100 mt-4"></div>
                </div>
            </div>
        </>
    );
}

const TextSections = () => {

    return (
        <div data-aos="fade-right" className="w-full max-w-[1200px] mt-20 flex flex-col md:flex-row justify-between items-start md:items-center p-4 mb-16">
            <p className="text-left font-medium text-[42px] md:text-[42px] mb-6 md:mb-0">
                Your <span className="text-[#57ff5a]">Trusted</span> Software
                <br />
                For Money Management
            </p>
            <img
                src={backgroundEllipse}
                alt="Background gradient"
                className=" select-none mt-28 w-[50rem] -z-50 -left-10 absolute"
            />

            <p className="text-right md:text-left text-xl md:text-[18px] md:ml-24 max-w-[400px]">
                Fluxo prioritizes security and reliability. With advanced encryption, 
                your data stays protected, and every transaction is verified for accuracy.
            </p>
        </div>
    );
}

const RectanglesSection = () => {
    return (
        <div className="flex flex-col md:flex-row justify-center items-end w-full max-w-[1200px]" data-aos="fade-up">
            <div className="bg-gradient-to-r from-[#1e1e1e] to-[#152032] h-[300px] w-full md:w-[450px] flex-shrink-0 p-6 border rounded-l-[22px] md:rounded-l-[22px] md:rounded-tl-[22px]">
                <p className="text-[#57ff5a] text-[48px] font-bold font-['Oldschool Grotesk'] leading-[60px]">01.</p>
                <p className="text-white text-[32px] font-normal font-['Oldschool Grotesk'] leading-[50px] mt-2">Privacy is our priority.</p>
            </div>

            <div className="bg-[#57ff5a] h-[390px] w-full md:w-[400px] mx-0 p-6 border border-[#57FF5A] rounded-t-[22px]">
                <p className="text-black text-[48px] font-bold font-['Oldschool Grotesk'] leading-[60px]">02.</p>
                <p className="text-black text-[32px] font-normal font-['Oldschool Grotesk'] leading-[50px] mt-2">Take control.</p>
                <p className="text-black text-[16px] font-normal leading-[28px] mt-2">
                    With Fluxo you can take care of finances, budgeting, spending, savings, debt, investments, 
                    net worth, refunds, subscriptions & more.
                </p>
                <p className="text-black text-[24px] font-bold underline leading-[22px] tracking-wide mt-4 cursor-pointer	">
                    Learn More
                </p>
            </div>

            <div className="bg-gradient-to-r from-[#152032] to-[#1e1e1e] shadow-inner h-[300px] w-full md:w-[450px] flex-shrink-0 p-6 border rounded-r-[22px] md:rounded-br-[22px] md:rounded-tr-[22px]">
                <p className="text-[#57ff5a] text-[48px] font-bold leading-[60px]">03.</p>
                <p className="text-white text-[32px] font-normal leading-[50px] mt-2">User-friendly interface.</p>
                <img
                src={backgroundEllipse}
                alt="Background gradient"
                className="mt-2 w-[50rem] -z-50 -right-10 absolute select-none"
            />
            </div>
        </div>
    );
};

const ImagesAndTextSection = () => {
    return (
        <div className="flex flex-col md:flex-row items-center justify-between w-full max-w-[1700px] p-4 mt-32">
            <div className="flex-shrink-0">
                <img 
                    src="MainPage.png" 
                    alt="Financial Management App" 
                    className="w-auto h-auto md:h-[45rem] object-cover select-none -ml-10 mr-20" 
                    data-aos="fade-up-right"
                />
            </div>

            <div className="mt-4 md:mt-0 md:ml-14 text-left" data-aos="fade-up-left"> 
                <h3 className="text-[3.4rem] font-medium font-['Inter'] leading-snug bg-gradient-to-r from-[#FFFFFF] to-[#999999] bg-clip-text text-transparent">
                    <span className="block">The Best</span>
                    <span className="block text-[#57ff5a]">Financial Management Software</span>
                    <span className="block">Available For Everyone</span>
                </h3>

                <img
                    src={stars}
                    alt="Background gradient"
                    className="mt-2 mb-6 select-none"
                />

                <div className="mt-4">
                    <p className="text-2xl font-thin text-white">
                        Fluxo is a reliable, 
                        <span className="font-bold"> secure software solution </span>
                        designed to streamline workflows with an intuitive, user-friendly interface. 
                        Trusted by professionals, it prioritizes <span className="font-bold">data protection</span> and delivers consistent, high-performance results, making productivity effortless.
                    </p>
                    <p className="text-2xl font-thin text-white mt-8">
                        Fluxo: The <span className="font-bold">secure, intuitive solution</span> for effortless workflow management.
                        Designed for trust and reliability, it keeps your data safe while boosting productivity.
                    </p>
                    <img
                        src={backgroundEllipse}
                        alt="Background gradient"
                        className="w-[50rem] bottom-0 -z-50 -left-10 absolute select-none"
                    />
                </div>

                <a href="https://github.com/codingburgas/finance-challenge-fluxo" target="_blank">
                <button className="mt-9 px-6 text-2xl font-medium py-2 bg-[#57ff5a] text-black rounded-2xl">
                    Download
                </button>
                </a>
            </div>
        </div>
    );
}



const Home = () => {
    return (
        <div className="flex flex-col items-center p-4 w-full"> 
            <div className="h-9"></div> 

            <div className="flex flex-col md:flex-row items-center w-full"> 
                <div className="md:w-1/2">
                    <Heading />
                </div>

                <div className="md:w-1/2 flex justify-end" data-aos="fade-down-left"> 
                    <img 
                        src="handsmoney.png" 
                        alt="Fluxo Illustration" 
                        className="md:w-[550px] h-auto object-cover select-none" 
                    />
                </div>
            </div>

            <div className="h-20"></div> 

            <div className="w-full flex flex-col items-center mt-6" data-aos="fade-up">
                <div className="flex justify-center items-center w-full max-w-[800px] space-x-4"> 
                    <img 
                        src="Group_10.png" 
                        alt="Left Icon" 
                        className="w-[60px] h-[60px] object-contain mr-2 select-none" 
                    />
                    <p className="text-gray-300 text-center text-[20px] md:text-[22px] font-light">
                        Using Fluxo makes managing your money easier than ever! Creating budgets, 
                        choosing a category, and making transactions seems like a dream now!
                    </p>
                    <img 
                        src="Group_11.png" 
                        alt="Right Icon" 
                        className="w-[60px] h-[60px] object-contain ml-2 select-none" 
                    />
                </div>
            </div>

            <div className="h-20"></div>

            <div className="w-full max-w-[1200px] p-4">
                <TextSections />
            </div>

            <div className="h-20"></div>

            <RectanglesSection />

            <div className="h-20"></div>

            <ImagesAndTextSection />

            <div className="h-20"></div>
        </div>
    );
}

export default Home;
