import { useEffect, useState } from 'react';

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

    return (
        <div className="text-left"> 
            <h2 className={`text-[25px] text-gray-400 transition-opacity duration-500 ${visible ? 'opacity-100' : 'opacity-0'}`}>
                {currentSentence}
            </h2>
            <h1 className="text-[55px] font-bold -mt-2 leading-tight">
                <span className="text-white">BEST</span> <span className="text-[#57ff5a]">FINANCIAL</span><br />
                <span className="text-[#57ff5a]">MANAGEMENT SYSTEM</span><br />
                <span className="text-gray-400">FOR YOUR FAMILY.</span>
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
    );
}

const TextSections = () => {
    return (
        <div className="w-full max-w-[1200px] mt-20 flex flex-col md:flex-row justify-between items-start md:items-center text-gray-300 p-4">
            <p className="text-left font-medium	text-[42px] md:text-[42px] mb-6 md:mb-0">
                Your <span className="text-[#57ff5a]">Trusted</span> Software
                <br />
                For Money Management
            </p>

            <p className="text-left md:text-right text-[16px] md:text-[18px] md:ml-auto max-w-[300px]">
                Fluxo prioritizes in security and reliability. With advanced encryption, 
                your data stays protected, and every transaction is verified for accuracy.
            </p>
        </div>
    );
}

const RectanglesSection = () => {
    return (
        <div className="flex flex-col md:flex-row justify-center items-end w-full max-w-[1200px]">
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
                <p className="text-black text-[24px] font-bold font-['Oldschool Grotesk'] underline leading-[22px] tracking-wide mt-4">
                    Learn More
                </p>
            </div>

            <div className="bg-gradient-to-r from-[#152032] to-[#1e1e1e] shadow-inner h-[300px] w-full md:w-[450px] flex-shrink-0 p-6 border rounded-r-[22px] md:rounded-br-[22px] md:rounded-tr-[22px]">
                <p className="text-[#57ff5a] text-[48px] font-bold font-['Oldschool Grotesk'] leading-[60px]">03.</p>
                <p className="text-white text-[32px] font-normal font-['Oldschool Grotesk'] leading-[50px] mt-2">User-friendly interface.</p>
            </div>
        </div>
    );
};

const ImagesAndTextSection = () => {
    return (
        <div className="flex flex-col md:flex-row items-center justify-between w-full max-w-[1200px] p-4 mt-20 rounded-lg">
            <div className="flex-shrink-0">
                <img 
                    src="MainPage.png" 
                    alt="Financial Management App" 
                    className="w-auto h-auto md:h-[810px] object-cover" 
                />
            </div>

            <div className="mt-4 md:mt-0 md:ml-8 text-left"> 
                {/* Heading */}
                <h3 className="text-[52px] font-semibold font-['Inter'] capitalize leading-snug">
                    <span className="text-white block">The Best</span>
                    <span className="text-[#57ff5a] block">Financial Management Software</span>
                    <span className="text-white block">Available For Everyone</span>
                </h3>

                <div className="mt-4">
                    <p className="text-[19px] font-light font-['Inter'] text-white">
                        Fluxo is a reliable, 
                        <span className="font-bold"> secure software solution </span>
                        designed to streamline workflows with an intuitive, user-friendly interface. 
                        Trusted by professionals, it prioritizes
                    </p>
                    <p className="text-[19px] font-light font-['Inter'] text-white">
                        <span className="font-bold">data protection</span> and delivers consistent, high-performance results, making productivity effortless.
                    </p>
                    <p className="text-[19px] font-bold font-['Inter'] text-white mt-4">
                        Fluxo: The secure, intuitive solution for effortless workflow management.
                    </p>
                    <p className="text-[19px] font-light font-['Inter'] text-white mt-4">
                        Designed for trust and reliability, it keeps your data safe while boosting productivity.
                    </p>
                </div>

                <button className="mt-8 px-4 text-2xl py-2 bg-[#57ff5a] text-black rounded-2xl">
                    Download
                </button>
            </div>
        </div>
    );
}

const Dashboard = () => {
    return (
        <div className="flex flex-col items-center p-4 w-full"> 
            <div className="h-9"></div> 

            <div className="flex flex-col md:flex-row items-center w-full"> 
                <div className="md:w-1/2">
                    <Heading />
                </div>

                <div className="md:w-1/2 flex justify-end"> 
                    <img 
                        src="handsmoney.png" 
                        alt="Fluxo Illustration" 
                        className="md:w-[550px] h-auto object-cover" 
                    />
                </div>
            </div>

            <div className="h-20"></div> 

            <div className="w-full flex flex-col items-center mt-6">
                <div className="flex justify-center items-center w-full max-w-[800px] space-x-4"> 
                    <img 
                        src="Group_10.png" 
                        alt="Left Icon" 
                        className="w-[60px] h-[60px] object-contain mr-2" 
                    />
                    <p className="text-gray-300 text-center text-[20px] md:text-[22px] font-light">
                        Using Fluxo makes managing your money easier than ever! Creating budgets, 
                        choosing a category, and making transactions seems like a dream now!
                    </p>
                    <img 
                        src="Group_11.png" 
                        alt="Right Icon" 
                        className="w-[60px] h-[60px] object-contain ml-2" 
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

export default Dashboard;