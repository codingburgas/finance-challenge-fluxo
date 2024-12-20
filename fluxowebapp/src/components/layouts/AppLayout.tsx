import { Outlet } from "react-router-dom";
import { Header } from "./Header";
//import { Footer } from "./Footer";

export function Applayout() {
    return (
        <>
            <Header />
            <div className="flex-grow flex flex-col">
                <div className="container px-0 md:px-1 flex-grow flex flex-col">
                    <Outlet />
                </div>
            </div>
        </>
    )
}
