import favicon from '/favicon.svg'; 

export function Logo() {
    return (
        <div className="flex justify-start select-none">
            <img src={favicon} alt="Logo"/>
        </div>
    );
}