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
        <div className="flex flex-row items-center p-4 mt-24">
            {/* Heading on the left */}
            <Heading />

            {/* Image on the right */}
            <div className="ml-10"> 
                <img 
                    src="https://via.placeholder.com/400"  // Replace this with your actual image URL
                    alt="Fluxo Illustration" 
                    className="w-[400px] h-auto object-cover"
                />
            </div>
        </div>
    );
}

export default Dashboard;
