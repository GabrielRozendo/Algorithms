using System;
using System.Collections.Generic;

namespace MaxStack
{
    public class MaxAwareEntry
    {
        public int Value { get; private set; }
        public int Max { get; set; }

        public MaxAwareEntry(int value)
        {
            Value = value;
        }
    }

    public class MaxAwareStack
    {
        public Stack<MaxAwareEntry> myStack = new Stack<MaxAwareEntry>();

        public void Push(int value)
        {
            MaxAwareEntry entry = new MaxAwareEntry(value);
            if (myStack.Count == 0)
                entry.Max = value;
            else
            {
                int currentMax = myStack.Peek().Max;
                entry.Max = currentMax >= value ? currentMax : value;
            }
            myStack.Push(entry);
        }

        public int? Pop()
        {
            if (myStack.Count == 0)
                return null;
            return myStack.Pop().Value;
        }

        public int? GetMax()
        {
          
            if (myStack.Count == 0)
                return null;
            return myStack.Peek().Max;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            MaxAwareStack myMaxAwareStack = new MaxAwareStack();

            myMaxAwareStack.Push(10);
            Console.WriteLine(myMaxAwareStack.GetMax()); //10
            myMaxAwareStack.Push(10);
            Console.WriteLine(myMaxAwareStack.GetMax()); //10
            myMaxAwareStack.Push(15);
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Push(1);
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Push(13);
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Push(19);
            Console.WriteLine(myMaxAwareStack.GetMax()); //19
            myMaxAwareStack.Push(20);
            Console.WriteLine(myMaxAwareStack.GetMax()); //20
            myMaxAwareStack.Push(3);
            Console.WriteLine(myMaxAwareStack.GetMax()); //20
            myMaxAwareStack.Push(7);
            Console.WriteLine(myMaxAwareStack.GetMax()); //20

            myMaxAwareStack.Pop(); //7
            Console.WriteLine(myMaxAwareStack.GetMax()); //20
            myMaxAwareStack.Pop(); //3 
            Console.WriteLine(myMaxAwareStack.GetMax()); //20
            myMaxAwareStack.Pop(); //20 
            Console.WriteLine(myMaxAwareStack.GetMax()); //19
            myMaxAwareStack.Pop(); //19 
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Pop(); //13 
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Pop(); //1 
            Console.WriteLine(myMaxAwareStack.GetMax()); //15
            myMaxAwareStack.Pop(); //15 
            Console.WriteLine(myMaxAwareStack.GetMax()); //10
            myMaxAwareStack.Pop(); //10
            Console.WriteLine(myMaxAwareStack.GetMax()); //--
        }
    }
}
