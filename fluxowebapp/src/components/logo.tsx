import favicon from '/favicon.svg'; 

export function Logo() {
    return (
        <div className="flex justify-start">
            <img src={favicon} alt="Logo"/>
        </div>
    );
}