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
            <h1 className="text-[55px] font-bold -mt-2 leading-tight">
                <span className="text-white">BEST</span> <span className="text-[#00FF66]">FINANCIAL</span><br />
                <span className="text-[#00FF66]">MANAGEMENT SYSTEM</span><br />
                <span className="text-gray-400">FOR YOUR FAMILY.</span>
            </h1>
            
            {/* three pics and two lines */}
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

const Dashboard = () => {
    return (
        <div className="flex flex-col items-center p-4 -mt-4"> 
            <div className="h-9"></div> {/* 1st gap */}
            
            <div className="flex flex-col md:flex-row items-center w-full -mt-6 md-10"> 
                <div className="md:w-1/2">
                    <Heading />
                </div>

                <div className="md:w-1/2 flex justify-end -mt-4 md:mt-0"> 
                    <img 
                        src="handsmoney.png" 
                        alt="Fluxo Illustration" 
                        className="md:w-[550px] h-auto object-cover" 
                    />
                </div>
            </div>

            <div className="h-12"></div> {/* gap */}

            {/* mid text and two icons on both sides */}
            <div className="w-full flex flex-col items-center mt-6">
                <div className="flex justify-center items-center w-full max-w-[800px] gap-8">
                    <img 
                        src="Group_10.png" 
                        alt="Left Icon" 
                        className="w-[60px] h-[60px] object-contain" 
                    />
                    <p className="text-gray-300 text-center text-[20px] md:text-[22px] font-light">
                        Using Fluxo makes managing your money easier than ever! Creating budgets, 
                        choosing a category, and making transactions seems like a dream now!
                    </p>
                    <img 
                        src="Group_11.png" 
                        alt="Right Icon" 
                        className="w-[60px] h-[60px] object-contain" 
                    />
                </div>
            </div>
        </div>
    );
}

export default Dashboard;
