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
    
    useEffect(() => {
        const interval = setInterval(() => {
            setIndex((prevIndex) => (prevIndex + 1) % sentences.length);
        }, 3000);
  
        return () => clearInterval(interval);
    }, []);
  
    useEffect(() => {
        setCurrentSentence(sentences[index]);
    }, [index]);
  
    return (
        <div className="text-left"> 
            <h2 className="text-[25px] text-gray-400">{currentSentence}</h2>
            <h1 className="text-[55px] font-bold mt-2 leading-tight">
                <span className="text-white">BEST</span> <span className="text-[#00FF66]">FINANCIAL</span><br />
                <span className="text-[#00FF66]">MANAGEMENT SYSTEM</span><br />
                <span className="text-gray-400">FOR YOUR FAMILY.</span>
            </h1>
        </div>
    );
};

const Dashboard = () => {
    return (
        <div className="flex flex-col md:flex-row items-start p-4 mt-8">
            {/* Left Section with Heading and Circular Images */}
            <div className="flex flex-col items-start md:w-1/2"> {/* Adjust the width for medium screens */}
                <Heading />

                {/* Circle Images Section */}
                <div className="flex flex-col items-center mt-8">
                    <div className="w-full h-0.5 bg-gray-100 mb-4"></div> {/* Top Line */}
                        <div className="flex justify-between w-full max-w-[900px] gap-16"> {/* Added gap for spacing */}
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
                    <div className="w-full h-0.5 bg-gray-100 mt-4"></div> {/* Bottom Line */}
                </div>
            </div>

            {/* Right Section with handsmoney Image */}
            <div className="ml-0 md:ml-10 mt-6 md:mt-0 order-last md:order-none"> 
                <img 
                    src="handsmoney.png" 
                    alt="Fluxo Illustration" 
                    className="w-full md:w-[450px] h-auto object-cover" 
                />
            </div>
        </div>
    );
}

export default Dashboard;
