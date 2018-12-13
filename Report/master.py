class noise:
    def __init__(self,size):
        self.size = size

    def choose_random(self):
        path = r"C:\Users\Darius\Desktop\sound samples\training data for RNN\rnnoise_contributions"
        files = os.listdir(path)
        index = random.randrange(0, len(files))
        if  files[index].endswith('.txt'):
            index = index -1
        file_path = os.path.join(path, files[index])
        self.sample, fs = sf.read(file_path, channels=2, samplerate=24100,format='RAW', subtype='PCM_16')

        i=0
        while i!=1:
            random_sequence = random.randrange(0,len(self.sample))
            if random_sequence + self.size < len(self.sample):
                i=1
        self.sample = self.sample[random_sequence:]
        self.sample = self.sample[:self.size ,:1]

        self.nfcc = python_speech_features.mfcc(self.sample,18000,0.025,0.01,24)

    def show_sample():
        print(file_path)
        plt.plot(self.sample)
    def listen_sample(self):
        sd.play(self.sample)


