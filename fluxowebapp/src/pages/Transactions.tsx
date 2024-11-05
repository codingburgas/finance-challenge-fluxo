import { PageHeader, PageHeaderHeading } from "@/components/page-header";
import {
  Card,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { useEffect } from "react";
import backgroundEllipse from "/radialEllipseBackground.png";

export default function Transactions() {
  useEffect(() => {
    document.body.classList.add("overflow-hidden");

    return () => {
      document.body.classList.remove("overflow-hidden");
    };
  }, []);
  return (
    <>
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -bottom-64 -right-10 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="-top-52 w-[50rem] -z-50 -left-24 absolute select-none"
      />
      <h1 className="font-semibold text-3xl mt-8 mb-5">Transactions History</h1>

      <div className="rounded-[0.5rem] border border-[#f5f5f5cb] bg-[#15203200] h-[4rem] w-[15rem] pt-2 pl-4">
        <h3 className="text-[#737375]">Balance</h3>
      </div>
      <hr className="mt-16 border-[#ffffff98]"></hr>
    </>
  );
}
